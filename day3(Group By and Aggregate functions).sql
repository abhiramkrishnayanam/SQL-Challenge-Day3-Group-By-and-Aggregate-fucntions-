/*Insert 10 rows into both tables, as given below.
 Create a table named Country with fields: Id Country_name Population Area Create another table named Persons
 with fields: Id Fname Lname Population Rating Country_Id Country_name 
 1. Write an SQL query to print the first three characters of Country_name from the Country table.
 2. Write an SQL query to concatenate first name and last name from Persons table. 
 3. Write an SQL query to count the number of unique country names from Persons table. 
 4. Write a query to print the maximum population from the Country table. 
 5. Write a query to print the minimum population from Persons table. 
 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
 7. Write a query to find the number of rows in the Persons table. 
 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
 10. List all persons ordered by their rating in descending order. 
 11. Find the total population for each country in the Persons table. 
 12. Find countries in the Persons table with a total population greater than 50,000 
 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons,
	 ordered by the average rating in ascending order.*/


use challenge;
CREATE TABLE Country_Info (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area FLOAT
);

INSERT INTO Country_Info (Id, Country_name, Population, Area) VALUES
(1, 'United States', 331002651, 9833520),
(2, 'China', 1439323776, 9596961),
(3, 'India', 1380004385, 3287263),
(4, 'Indonesia', 273523615, 1904569),
(5, 'Pakistan', 220892340, 881912),
(6, 'Brazil', 212559417, 8515767),
(7, 'Nigeria', 206139589, 923768),
(8, 'Bangladesh', 164689383, 147570),
(9, 'Russia', 145934462, 17098242),
(10, 'Mexico', 128932753, 1964375);
select *from country_info;


CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(100)
);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 331002651, 4.5, 1, 'United States'),
(2, 'Jane', 'Smith', 331002651, 4.3, 1, 'United States'),
(3, 'Alice', 'Johnson', 1439323776, 4.7, 2, 'China'),
(4, 'Bob', 'Brown', 1439323776, 4.2, 2, 'China'),
(5, 'Charlie', 'Davis', 1380004385, 4.6, 3, 'India'),
(6, 'David', 'Miller', 1380004385, 4.4, 3, 'India'),
(7, 'Eva', 'Wilson', 212559417, 4.8, 4, 'Brazil'),
(8, 'Frank', 'Taylor', 212559417, 4.1, 4, 'Brazil'),
(9, 'Grace', 'Anderson', 145934462, 4.9, 5, 'Russia'),
(10, 'Hannah', 'Thomas', 145934462, 4.0, 5, 'Russia');
select *from persons;

#1. Write an SQL query to print the first three characters of Country_name from the Country table.

SELECT left(Country_name, 3) AS FirstThreeChars
FROM Country_Info;

#2. Write an SQL query to concatenate first name and last name from Persons table. 

SELECT concat(Fname,' ',Lname) AS Name
FROM persons;
#3. Write an SQL query to count the number of unique country names from Persons table. 

select count(country_name) from persons group by country_name;

 #4. Write a query to print the maximum population from the Country table. 
 select country_name , population from country_info where population = (select max(population) from country_info ); 
 
 #5. Write a query to print the minimum population from Persons table. 
  select country_name , population from persons where population = (select min(population) from persons ) ;
  
 #6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
 INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'John','', 331002651, 4.5, 1, 'United States');
SELECT count(LNAME) FROM PERSONS;
SELECT * FROM PERSONS;

 #7. Write a query to find the number of rows in the Persons table. 
 SELECT count(ID) FROM PERSONS;
 
 #8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
 SELECT ID ,POPULATION FROM COUNTRY_INFO LIMIT 3;
 
 #9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
 SELECT * FROM COUNTRY_INFO ORDER BY RAND()  LIMIT 3;
 
 #10. List all persons ordered by their rating in descending order.
 select *from persons order by RATING DESC;
 
 #11. Find the total population for each country in the Persons table. 
 select COUNTRY_NAME,
 SUM(POPULATION) FROM persons GROUP by COUNTRY_NAME;
 
 #12. Find countries in the Persons table with a total population greater than 50,000 
SELECT COUNTRY_NAME, SUM(POPULATION) AS total_population
FROM persons
GROUP BY COUNTRY_NAME
HAVING SUM(POPULATION) > 50000;
  
  
 /*13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons,
	 ordered by the average rating in ascending order.*/

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(12, 'JoE', 'Don', 331002677, 4.8, 2, 'CHINA');
SELECT 
    COUNTRY_NAME, 
    COUNT(ID) AS total_persons, 
    AVG(RATING) AS avg_rating
FROM 
    persons
GROUP BY COUNTRY_NAME HAVING COUNT(ID) > 2 ORDER BY avg_rating ASC;

/*14. Find the highest rating from each country*/
SELECT Country_name, MAX(Rating) AS Highest_Rating
FROM Persons
GROUP BY Country_name;

#15. Count how many unique countries are in the Persons table.
Select count(distinct(country_name))as Count_of_Countries from country_info;

#16Find the countries where the number of persons is more than 1.
Select count(*) as Number_of_persons ,country_name
from Persons 
group by country_name 
having count(*) > 1;
