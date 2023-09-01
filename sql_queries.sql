SELECT S.CompanyName AS SellerName, P.Pname AS ProductName, PS.Stock AS StockQuantity
FROM Seller S
INNER JOIN productStock PS ON S.idSeller = PS.idPStock
INNER JOIN Product P ON PS.idProduct = P.idProduct;

SELECT P.Category, AVG(P.Price) AS AveragePrice
FROM Product P
GROUP BY P.Category;

SELECT O.idOrder, O.orderStatus, SUM(O.sendValue) AS TotalOrderValue
FROM Orders O
WHERE O.orderStatus = 'Cancelled'
GROUP BY O.idOrder, O.orderStatus;

SELECT paymentMethods, COUNT(*) AS Count
FROM Payment
GROUP BY paymentMethods
ORDER BY Count DESC;

SELECT P.Pname, P.Rating
FROM Product P
WHERE P.Rating > 4.5;

SELECT C.idClient, C.Fname, C.Surname, SUM(O.sendValue) AS TotalOrderValue
FROM Cliente C
LEFT JOIN Orders O ON C.idClient = O.idOrderClient
GROUP BY C.idClient;

SELECT S.CompanyName, COUNT(PS.idPProduct) AS NumberOfProducts
FROM Supplier S
LEFT JOIN productSupplier PS ON S.idSupplier = PS.idPSupplier
GROUP BY S.CompanyName;

SELECT PS.idProduct, P.Pname, SL.Location, PS.Stock
FROM productStock PS
INNER JOIN storageLocation SL ON PS.idPStock = SL.idLstorage
INNER JOIN Product P ON PS.idProduct = P.idProduct;

SELECT C.idClient, C.Fname, C.Surname, O.idOrder, O.orderStatus
FROM Cliente C
LEFT JOIN Orders O ON C.idClient = O.idOrderClient;

SELECT P.Category, MAX(P.Price) AS MaxPrice
FROM Product P
GROUP BY P.Category;