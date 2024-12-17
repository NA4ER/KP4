USE carshow;


SELECT SUM(Price) AS Total_Sales
FROM Sales
WHERE DateOfSales >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);
