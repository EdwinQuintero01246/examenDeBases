WITH Ctea as 
( 
    SELECT
        Supp.SupplierID,
        MONTH(Ord.OrderDate) as Mes,
        AVG(OrdD.QUantity*Pro.Price ) as Promedio,
        SUM(OrdD.QUantity*Pro.Price) as ventas
    FROM example.Orders as Ord
    INNER JOIN example.OrderDetails as OrdD
    on Ord.OrderID = OrdD.OrderID
    INNER JOIN example.Products as Pro
    on OrdD.ProductID = Pro.ProductID
    INNER JOIN example.Suppliers as Supp
    on Pro.SupplierID = Supp.SupplierID
GROUP BY MONTH(Ord.OrderDate),Supp.SupplierID
), VentasMensual AS(
    SELECT
        SUM(Ords.QUantity*Pro.Price) as Ventas
    FROM example.Orders as Ord
    INNER JOIN example.OrderDetails as Ords
    ON Ord.OrderID = Ords.OrderID
    INNER JOIN example.Products as Pro
    on Ords.ProductID = Pro.ProductID
    INNER JOIN example.Suppliers as Supp
    on Pro.SupplierID = Supp.SupplierID
)
SELECT 
    Cus.CustomerID,
    Cus.CustomerName,
    Supp.SupplierID,
    Supp.SupplierName,
    MONTH(Ord.OrderDate) as Mes,
    YEAR(Ord.OrderDate) as Year,
    SUM(Ords.QUantity*Pro.Price) as Total,
    CASE
        WHEN C.Promedio >= SUM(Ords.QUantity*Pro.Price) THEN 0
        WHEN C.Promedio < SUM(Ords.QUantity*Pro.Price) THEN 1
    END as SuperoPromedio,
    SUM((Ords.QUantity*Pro.Price)/C.ventas) as PorcentajeVentasMensuales
FROM example.Customers as Cus
INNER JOIN example.Orders as Ord
on Cus.CustomerID = Ord.CustomerID
INNER JOIN example.OrderDetails as Ords
on Ord.OrderID = Ords.OrderID
INNER JOIN example.Products as Pro
on Ords.ProductID = Pro.ProductID
INNER JOIN example.Suppliers as Supp
on Pro.SupplierID = Supp.SupplierID
INNER JOIN Ctea as C
on Supp.SupplierID = C.SupplierID and MONTH(Ord.OrderDate) = C.Mes
GROUP BY Cus.CustomerID,Cus.CustomerName,Supp.SupplierID,Supp.SupplierName,MONTH(Ord.OrderDate),YEAR(Ord.OrderDate),C.Promedio