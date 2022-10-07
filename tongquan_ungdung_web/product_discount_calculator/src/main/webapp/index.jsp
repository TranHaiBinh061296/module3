<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<form action="/discount" method="post">
    <div class="Calculator">
        <h2>Discount Calculator</h2>
        <label>Product Description:</label><br>
        <input type="text"   size="30" placeholder="Ten san pham" /><br>
        <label>List Price:</label><br>
        <input type="text" name="price"  size="30" placeholder="Gia" /><br>
        <label>Discount Percent:</label><br>
        <input type="text" name="discount"  size="30" placeholder="phan tram" /><br>
        <input type="submit" value="Calculate Discount"/>
    </div>
</form>
</body>
</html>