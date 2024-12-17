USE carshow;

SELECT Employee_ID, SUM(Price) AS Total_Sales
FROM Sales
WHERE DateOfSales >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY Employee_ID;