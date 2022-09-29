/**
	# Tao function don gian
SET GLOBAL log_bin_trust_function_creators = 1;
delimiter //
create function sumAB(a Integer, b Integer)
returns Integer
begin
	#if, else, while....
    #declare
	return a + b;
end //
# Tao procedure them san pham
delimiter //
create procedure sp_insertProduct(
	IN sMaSP char(4),
    IN sTenSP varchar(40),
    IN sDVT varchar(20),
    IN sNuocSX varchar(40),
    IN sGia decimal(10,2),
    OUT sMessage varchar(100)
)
begin
	declare flag boolean;
	set sMessage = "";
    set flag = true;	#Neu flag = true thi insert
	if(exists (SELECT MaSP FROM c6_quanlybanhang.sanpham where MaSP = sMaSP)) then
		set sMessage = "Ma SP da ton tai";
        set flag = false;
	end if;
    
	if(flag = true) then
		insert into sanpham(MaSP, TenSP, DVT, NuocSX, Gia) values (sMaSP, sTenSP, SDVT,sNuocSX, sGia);
        set sMessage = "Them thanh cong";
	end if;
end //
**/

delimiter //
CREATE PROCEDURE `sp_deposit_c6`(
	IN sFullName varchar(100),
    IN sEmail varchar(50),
    IN sPhone varchar(11),
    IN sAddress varchar(50),
    IN sTransactionAmount decimal(12,0)
)
begin
	declare total decimal(12,0);
    declare sCustomerId integer;
    
    # Kiem tra customer_id co ton tai hay chua
    if(not exists (SELECT `email` FROM `customers` where `email` = sEmail)) then 
		INSERT INTO `customers` (`full_name`, `email`, `phone`, `address`, `balance`, `deleted`) VALUES (sFullName, sEmail, sPhone, sAddress, '0', '0');
    end if;
    
    set sCustomerId = (SELECT id FROM `customers` where `email` = sEmail);
	INSERT INTO `deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) VALUES (now(), '0', sCustomerId, sTransactionAmount);
    
    set total = (SELECT balance from customers where id = sCustomerId);
    set total = total + sTransactionAmount;
    
    UPDATE `customers` SET `balance` = total WHERE (`id` = sCustomerId);
    
    end //

delimiter //
create procedure `sp_deposits`(
in sID bigint,
in sTransactionAmount decimal(12,0),
out sMessage text
)
begin 
declare total decimal(12,0);

/*kiem tra id ton tai hay chua*/
	if(not exists (select `id` from `customers` where `id` = sID)) then
	set sMessage = "Tai khoan khong ton tai !!!";
    else 
    INSERT INTO `deposits` (`created_at`, `deleted`, `customer_id`, `transaction_amount`) 
    VALUES (now(), '0', sID, sTransactionAmount);
    
    set total = (select balance from customers where id = sID);
    set total = total + sTransactionAmount;
    update `customers` set `balance` = total where (`id` = sID);
    set sMessage = "Nop tien thanh cong";
    end if;
    end //
    
    delimiter //
    create procedure sp_withdraws(
    in sID bigint,
    in sAmount decimal(12,0),
    out sMessage text
    )
    begin
		declare total decimal(12,0);
        if (not exists (select `id` from `customers` where `id` = sID)) then
        set sMessage = "Tai khoan khong ton tai";
        else 
		set total = (SELECT balance from customers where id = sID);
		if (sAmount > total) then
			set sMessage = 'So du tai khoan hien tai khong du';
			else
			set total = total - sAmount;
			UPDATE `customers` SET `balance` = total WHERE (`id` = sID);
            insert into `withdraws` (customer_id, transaction_amount) values (sID, sAmount);
            set sMessage = 'Rut tien thanh cong';
		end if;
	end if;
end; //
delimiter //
create procedure sp_transfers(
	in sSender_id bigint,
    in sRecipient_id bigint,
    in sTransaction_amount decimal(12,0),
    out notice text
)
begin
	declare totalSend decimal(12,0);
    declare totalRecipient decimal(12,0);
    declare sFees int;
    declare sfees_amount decimal(12,0);
    declare sTransfer_amount decimal(12,0);
    if ((not exists (select `id` from `customers` where `id` = sSender_id)) or
		(not exists (select `id` from `customers` where `id` = sRecipient_id))) then
		set notice = 'Tai khoan khong ton tai!';
	elseif (sTransaction_amount < 10000) then set notice = 'So tien toi thieu chuyen la 10000 VND!';
	else
		set totalSend = (SELECT balance from customers where id = sSender_id);
        set totalRecipient = (SELECT balance from customers where id = sRecipient_id);
        
        if (sTransaction_amount <= 1000000) then set sFees = 0;
        elseif (sTransaction_amount <= 100000000) then set sFees = 1;
        else set sFees = 2;
        end if;
        set sfees_amount = round((sTransaction_amount * sFees)/100);
        set sTransfer_amount =  sTransaction_amount - sfees_amount;
        
		if (sTransaction_amount > totalSend) then
			set notice = 'So du tai khoan hien tai khong du!';
		else
			set totalSend = totalSend - sTransaction_amount;
            UPDATE `customers` SET `balance` = totalSend WHERE (`id` = sSender_id);
            set totalRecipient = totalRecipient + sTransfer_amount;
            UPDATE `customers` SET `balance` = totalRecipient WHERE (`id` = sRecipient_id);
            
            insert into `transfers` (fees, fees_amount, transaction_amount, transfer_amount, recipient_id, sender_id)
				values(sFees, sfees_amount, sTransaction_amount, sTransfer_amount, sRecipient_id, sSender_id);
                
			INSERT INTO `deposits` (`customer_id`, `transaction_amount`) VALUES (sRecipient_id, sTransfer_amount);
            insert into `withdraws` (customer_id, transaction_amount) values (sSender_id, sTransaction_amount);
            set notice = 'Chuyen tien thanh cong!';
        end if;
    end if;
end; //
    
--     delimiter //
--     create procedure sp_transfers(
--     in sID_Sender bigint,
--     in sID_Recipient bigint,
--     in sTransaction_amount decimal(12,0),
--     out sMessage text
--     )
--     begin
--     declare totalSend decimal(12,0);
--     declare totalRecipient decimal(12,0);
--     declare sFees int;
--     declare sfees_amount decimal(12,0);
--     declare sTransfer_amount decimal(12,0);
--     if ((not exists (select `id` from `customers` where `id` = sID_Sender)) or 
-- 		(not exists (select `id` from `customers` where `id`= sID_Recipient))) then
--         set sMessage = "Tai khoan khong ton tai";
--         elseif (sTransfer_amount < 50000) then set sMessage = "So tien chuyen di phai lon hon 50000 vnd";
--         else
--         set totalSend = (select balance from customers where id = sID_Sender);
--         set totalRecipient = (select balance from customers where id = sID_Recipient);
--         
--         if (sTransfer_amount <= 50000000) then set sFees = 0;
--         elseif (sTransfer_amount <= 500000000) then set sFees = 1;
--         else set sFees = 2;
--         end if;
--         
--         set sfees_amount = round((sTransfer_amount * sFees)/100);
--         set sTransfer_amount = sTransfer_amount - sfees_amount;
--         
--         if (sTransfer_amount > totalSend) then
-- 			set sMessage = "So du cua ban khong du !!!";
-- 		else 
--         set totalSend = totalSend - sTransaction_amount;
--         update `customers` set `balance` = totalSend where (`id` = sID_Sender);
--         set totalRecipient = totalRecipient + sTransfer_amount;
--         update `customers` set `balance` = totalRecipient where (`id` = sID_Recipient);
--         
--         INSERT INTO `transfers` (`fees`, `fees_amount`, `transaction_amount`, `transfer_amount`, `recipient_id`, `sender_id`)
--         VALUES (sFees, sfees_amount, sTransaction_amount, sTransfer_amount, sID_Recipient, sID_Sender);

-- 			INSERT INTO `deposits` (`customer_id`, `transaction_amount`) VALUES (sRecipient_id, sTransfer_amount);
--             insert into `withdraws` (customer_id, transaction_amount) values (sSender_id, sTransaction_amount);
--             set sMessage = 'Chuyen tien thanh cong!';
--         end if;
--     end if;
--     end; //