CREATE table example.fact_summary(
    CustomerID int,
    CustomerName NVARCHAR(50),
    SupplierID int,
    SupplierName NVARCHAR(100),
    Mes int,
    [year] int,
    Total int,
    SuperoPromedio int,
    PorcentajeVentaMensual DECIMAL
)
CREATE table example.settings(
    settingsID int,
    [Value] Int
)
/*drop table example.fact_summary*/