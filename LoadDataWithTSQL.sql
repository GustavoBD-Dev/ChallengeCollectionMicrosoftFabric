-- From multiple files 
COPY my_table
FROM 'https://myaccount.blob.core.windows.net/myblobcontainer/folder0/*.csv, 
    https://myaccount.blob.core.windows.net/myblobcontainer/folder1/'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='<Your_SAS_Token>')
    FIELDTERMINATOR = '|'
)

-- From PARQUET file 
COPY my_table
FROM 'https://myaccount.blob.core.windows.net/myblobcontainer/folder0/*.csv, 
    https://myaccount.blob.core.windows.net/myblobcontainer/folder1/'
WITH (
    FILE_TYPE = 'CSV',
    CREDENTIAL=(IDENTITY= 'Shared Access Signature', SECRET='<Your_SAS_Token>')
    FIELDTERMINATOR = '|'
)

-- From another warehouses and lakehouses
CREATE TABLE [analysis_warehouse].[dbo].[combined_data]
AS
SELECT 
FROM [sales_warehouse].[dbo].[sales_data] sales
INNER JOIN [social_lakehouse].[dbo].[social_data] social
ON sales.[product_id] = social.[product_id];