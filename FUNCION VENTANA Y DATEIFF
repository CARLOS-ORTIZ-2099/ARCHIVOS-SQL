
USE Northwind 
GO 



--CLAUSULA DATEIFF PARA SACAR LA DIFERENCIA ENTRE FECHAS--


SELECT os.ShipCountry, os.CustomerID, os.OrderDate ,
datediff(DAY,lag(os.OrderDate)over(partition by cu.companyname order by os.orderdate ASC), os.OrderDate ) ,
cu.CompanyName, cu.Country, od.ProductID, od.Quantity*od.UnitPrice as monto,
sum(od.UnitPrice*od.Quantity) over (partition by cu.companyname ) as total,

od.Quantity*od.UnitPrice/sum(od.UnitPrice*od.Quantity) over(partition by cu.companyname )*100 as porcentaje,

sum(Quantity*od.UnitPrice)over(partition by cu.CompanyName order by os.orderdate)/sum(Quantity*od.UnitPrice)
over(partition by cu.companyname )*100


FROM Orders os INNER JOIN Customers cu on Os.CustomerID=Cu.CustomerID inner join [Order Details] od on os.OrderID = od.OrderID

SELECT datediff(DAY,'1/01/2020','1/01/2021')

-- DEBEMOS DE MENCIONAR QUE LA CLAUSULA DATEIFF TRABAJA COMO UNA ESPECIE DE PROYECTOR
-- ES DECIR LOS PARAMETROS A INGRESAR DEBN DE SER DE PRIMERO EL VALOR MENOR Y SEGUIDAMENTE EL VALOR MAYOR
-- ENTONCES DIREMOS QUE QUIERO PROYECTAR LA DIFERENCIA EN DIAS DESDE LA FECHA INICIAL HASTA LA FECHA MAYOR
SELECT datediff(DAY,'1/01/2021','1/01/2020')










