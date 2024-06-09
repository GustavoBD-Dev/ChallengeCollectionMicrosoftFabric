
-- Changes type 2 SCD for the Dim_products: add news records for changes,
-- keeps full history for a given natural key

IF EXISTS (SELECT 1 FROM Dim_Products WHERE SourceKey = @ProductID AND IsActive = 'True')
BEGIN
    -- Existing product record
    UPDATE Dim_Products
    SET ValidTo = GETDATE(), IsActive = 'False'
    WHERE SourceKey = @ProductID AND IsActive = 'True';
END
ELSE
BEGIN
    -- New product record
    INSERT INTO Dim_Products (SourceKey, ProductName, StartDate, EndDate, IsActive)
    VALUES (@ProductID, @ProductName, GETDATE(), '9999-12-31', 'True');
END