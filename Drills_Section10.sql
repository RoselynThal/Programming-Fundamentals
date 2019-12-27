--1. Determine number of records in vehicles tables 
--Answer: 33,442 records

SELECT COUNT(*)
FROM vehicles;

--2. Return all the records in vehicles tables

SELECT *
FROM vehicles;

--3. Return id, make, and model fields for all records for 2010 vehicles

SELECT id, make, model
FROM vehicles
WHERE year=2010;

--4. Return count of vehicles from 2010
--Answer: 1109 records

SELECT COUNT(*)
FROM vehicles
WHERE year=2010;

--5. Return count of vehicles in vehicles table between the years 2010 and 2015, inclusive
--Answer: 5595 records

SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 2010 and 2015;


--6. Return count of vehicles from the years 1990, 2000, and 2010
--Answer: 3026 records

SELECT COUNT(*)
FROM vehicles
WHERE year IN(1990,2000,2010);

--7. Return count of all records between 1987 and 2005, exclusive of years 1990 and 2000
--Answer: 17,235 records

SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 1987 AND 2005 
	AND year NOT IN (1990, 2000);
	
--8. Return year, make, model, and a field called
--average_mpg that calculates the average highway/city fuel consumption
--(For example, if hwy is 24 and cty is 20, then average_mpg = (24 + 20)/ 2 = 22.)

SELECT year, make, model, (hwy+cty)/2 AS average_mpg
FROM vehicles;

--9. Return year, make, model, and a text field displaying “X highway; Y city.” 
--(For example, if hwy is 24 and cty is 20, then hwy_city is “24 highway; 20 city.”)

SELECT year, make, model, CONCAT(hwy, ' highway; ', cty, ' city.') AS hwy_city
FROM VEHICLES;

-- also possible (equivalent way to do same query)

SELECT year, make, model, hwy || ' highway; ' || cty || ' city;' AS hwy_city
FROM vehicles;

--10. Return id, make, model, and year for all records that have NULL for either the cyl or displ fields

SELECT id, make, model, year
FROM vehicles
WHERE cyl IS NULL or displ IS NULL;

--11. Return all fields for records with rear-wheel drive and diesel vehicles since 2000, inclusive. 
--Also sort by year and highway mileage, both descending. Hint: to view the distinct values in a field, 
--you can use DISTINCT. For example, use SELECT DISTINCT(drive) FROM vehicles; to get the unique values 
--that appear in that field, or use SELECT DISTINCT(fuel) FROM vehicles;.

SELECT DISTINCT(drive)
FROM vehicles;

SELECT DISTINCT(fuel)
FROM vehicles;

SELECT *
FROM vehicles
WHERE 
	year >= 2000 
	AND drive = 'Rear-Wheel Drive'
	AND fuel = 'Diesel'
ORDER BY year DESC, hwy DESC;

--12. Count the number of vehicles that are either Fords or Chevrolets and either compact cars or 2-seaters
--Answer: 612 vehicles

SELECT DISTINCT(class)
FROM vehicles;

SELECT DISTINCT(make)
FROM vehicles;

SELECT COUNT(*)
FROM vehicles
WHERE (make = 'Ford' OR make = 'Chevrolet')
	AND (class = 'Compact Cars' OR class = 'Two Seaters');

--This also works
SELECT COUNT(*)
FROM vehicles
WHERE make IN ('Ford','Chevrolet')
	AND class IN ('Compact Cars', 'Two Seaters');
	
--13. Return records for 10 vehicles with the highest highway fuel mileage

SELECT*
FROM vehicles
ORDER BY hwy desc
LIMIT 10;

--14. Return all the records of vehicles since the year 2000 
--whose model name starts with a capital X. Sort the list A through Z by make
--Answer: When you use a lowercase 'x', you are returned less records and just Scion make

SELECT *
FROM vehicles
WHERE model LIKE 'X%'
	AND year >= 2000
ORDER BY make;

SELECT *
FROM vehicles
WHERE model LIKE 'x%'
	AND year >= 2000
ORDER BY make;

--15. Return count of records where the “cyl” field is NULL
--Answer: 58 records

SELECT COUNT(*)
FROM vehicles
WHERE cyl IS NULL;

--16. Return count of all records before the year 2000 that 
--got more than 20 mpg hwy and had greater than 3 liters displacement (“displ” field). 
--Answer: 1964 records

SELECT COUNT(*)
FROM vehicles
WHERE year < 2000
	AND hwy > 20 
	AND displ > 3;
	
--17. Returns all records whose model name has a (capital) X in its 3rd position. 
--Hint: make sure your wildcard operator accommodates for any characters after the “X”!

SELECT *
FROM vehicles
WHERE model LIKE '__X%';