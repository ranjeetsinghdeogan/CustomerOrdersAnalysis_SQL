---Retrieve customer names and their total number of orders---
Select c.CompanyName as CustomerName,
Count(o.OrderID) as TotalOrders
From Customers as c
Left Join Orders as o
On c.CustomerID = o.CustomerID
GROUP BY c.CompanyName;

---Find customers who have made no orders---
Select c.CompanyName
From Customers as c
Left Join Orders as o
On c.CustomerID = o.CustomerID
Where o.OrderID Is Null;

---Orders with amount greater than the average order amount---

Select OrderID, Freight
From Orders
Where Freight >(Select Avg(Freight) From Orders);

---Customer names and total order amount sorted by highest amount---

Select c.CompanyName as CustomerName,
Sum(o.Freight) as TotalOrderAmount
From Customers as c
Join Orders as o
On c.CustomerID = o.CustomerID
Group By c.CompanyName
Order By TotalOrderAmount DESC;

---Top 3 customers who spent the most---

Select TOP 3 c.CompanyName as CustomerName,
Sum(o.Freight) as TotalSpent
From Customers as c
Join Orders as o
On c.CustomerID = o.CustomerID
Group By c.CompanyName
Order By TotalSpent DESC;