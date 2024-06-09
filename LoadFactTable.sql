-- In this example, we use a JOIN operation to look up the DateKey and
-- ProductKey values in the Dim_Date and Dim_Product tables, respectively, 
-- and then insert the data into the Fact_Sales table.

-- Lookup keys in dimension tables
INSERT INTO Fact_Sales (DateKey, ProductKey, OrderID, Quantity, Price, LoadTime)
SELECT d.DateKey, p.ProductKey, o.OrderID, o.Quantity, o.Price, GETDATE()
  FROM Order_Detail o
  JOIN Dim_Date d ON o.OrderDate = d.Date
  JOIN Dim_Product p ON o.ProductID = p.ProductID;