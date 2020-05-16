ALTER PROCEDURE example.SP_factummaryS
AS
BEGIN
    SELECT 
    Cus.CustomerID,
    Cus.CustomerName,
    Supp.SupplierID,
    Supp.SupplierName, 
    MONTH(Ord.OrderDate) as Mes,
    YEAR(Ord.OrderDate) as year, 
    OrdD.QUantity*Pro.Price as Total,
    AVG(Pro.Price) as SuperoPromedio,
    Sum(Pro.Price)/(OrdD.QUantity*Pro.Price) as PorcentajeVentaMensual
FROM example.Customers as Cus
INNER JOIN example.Orders as Ord
on Cus.CustomerID = Ord.CustomerID
INNER Join example.OrderDetails as OrdD
on Ord.OrderID = OrdD.OrderID
INNER JOIN example.Products as Pro
on OrdD.ProductID = Pro.ProductID
INNER JOIN example.Suppliers as Supp
on Pro.SupplierID = Supp.SupplierID
GROUP BY Cus.CustomerID,Cus.CustomerName,Supp.SupplierID,Supp.SupplierName,Ord.OrderDate,OrdD.QUantity,Pro.Price
END

EXEC example.SP_factummaryS