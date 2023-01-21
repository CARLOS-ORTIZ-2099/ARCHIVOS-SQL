select * from  Suppliers

select * from Products 

select * from [Order Details] 


select Suppliers.SupplierID,Suppliers.CompanyName,Products.ProductName,Products.UnitPrice,Products.CategoryID,
[Order Details].ProductID,[Order Details].UnitPrice,[Order Details].Quantity,
[Order Details].UnitPrice*[Order Details].Quantity as total,
sum([Order Details].UnitPrice*[Order Details].Quantity)over(partition by suppliers.companyName) as ventas_globales

from Suppliers inner join Products on Suppliers.SupplierID = Products.SupplierID 
inner join [Order Details]on Products.ProductID = [Order Details].ProductID

where [Order Details].Quantity > 20 and [Order Details].UnitPrice between 50 and 70

order by Suppliers.CompanyName asc 

--order by Suppliers.SupplierID asc 

