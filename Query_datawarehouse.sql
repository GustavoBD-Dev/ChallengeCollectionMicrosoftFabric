-- Create a view

-- Note that the attributes in the time dimension enable 
-- you to aggregate the measures in the fact table at 
-- multiple hierarchical levels - in this case, year and month.
-- This is a common pattern in data warehouses.

CREATE VIEW vSalesByRegion AS
SELECT  d.[Year] AS CalendarYear,
        d.[Month] AS MonthOfYear,
        d.MonthName AS MonthName,
        c.CountryRegion AS SalesRegion,
        SUM(so.SalesTotal) AS SalesRevenue
  FROM  FactSalesOrder AS so
  JOIN  DimDate AS d ON so.SalesOrderDateKey = d.DateKey
  JOIN  DimCustomer AS c ON so.CustomerKey = c.CustomerKey
 GROUP BY d.[Year], d.[Month], d.MonthName, c.CountryRegion;


-- Query to view
-- include sales revenue aggregated by year, month, and sales region.
SELECT CalendarYear, 
       MonthName, 
       SalesRegion,
       SalesRevenue
  FROM vSalesByRegion
 ORDER BY CalendarYear, MonthOfYear, SalesRegion;