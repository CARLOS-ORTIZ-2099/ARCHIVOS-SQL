select 
concat(Employees.FirstName,' ', Employees.LastName) as nombre_completo,  
orders.orderdate,
DATEPART(day,orders.OrderDate -lag(Orders.OrderDate)
over(partition by concat(Employees.FirstName,' ', Employees.LastName) order by orders.OrderDate asc ) )
from 
Employees inner join orders on Employees.EmployeeID = orders.EmployeeID 

--order by HireDate asc 



select * 
from 
Employees 


select 
* 
from 
Orders  
order by EmployeeID asc 
