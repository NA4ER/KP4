USE carshow;

SELECT * FROM Cars
WHERE Car_ID NOT IN (SELECT Car_ID FROM Orders);