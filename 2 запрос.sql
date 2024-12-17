Use CarShow;

SELECT Clients.Client_Name AS 'Покупатель', Employees.Employee_Name AS 'Продавец', Cars.Brand AS 'Марка', Cars.Model AS 'Модель', Sales.Price AS 'Стоимость', Sales.DateOfSales AS 'Дата продажи'
FROM Sales JOIN Clients ON Sales.Client_ID = Clients.Client_ID
			JOIN Employees ON Sales.Employee_ID = Employees.Employee_ID
            JOIN Cars ON Sales.Car_ID = Cars.Car_ID

