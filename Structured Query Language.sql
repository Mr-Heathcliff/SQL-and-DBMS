/*Student ID	Student Name
 48368830	    Abdul Matin Rassoli
 47943645       Erick Ruwona
 48605263       Daivik Soni
 48419893	    Nicholas Shih
 47401621	    Lachlan Smith
*/




-- Question-A
-- Table Creation (Incomplete and Erroneous - please fix the errors and complete this section)
CREATE SCHEMA ChocolateNation;
USE ChocolateNation;

CREATE TABLE Promotion (
	PromoID CHAR(3) NOT NULL,
	PromoName VARCHAR(50) NOT NULL,
	PromoDiscount DECIMAL(4,1) NOT NULL,
    PRIMARY KEY (PromoID)
);

CREATE TABLE Category (
	CategoryID CHAR(5) NOT NULL,
	CategoryName VARCHAR(50) NOT NULL,
	CategoryDesc VARCHAR(200) NOT NULL,
	PRIMARY KEY (CategoryID)
);

CREATE TABLE Chocolate (
	ChocolateID CHAR(6) NOT NULL,
	ChocolateName VARCHAR(50) NOT NULL,
	ChocolateDesc VARCHAR(200) NOT NULL,
	ChocolatePrice DECIMAL (5, 2) NOT NULL,
	ChocolateWeight INT NOT NULL,
	CategoryID CHAR(5) NOT NULL,
    PRIMARY KEY (ChocolateID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE Discount (
	PromotionID CHAR(3) NOT NULL,
	ChocolateID CHAR(6) NOT NULL,
	StartDate DATETIME NOT NULL,
	EndDate DATETIME NOT NULL,
	PRIMARY KEY (PromotionID, ChocolateID), 
    FOREIGN KEY (PromotionID) REFERENCES Promotion(PromoID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);

CREATE TABLE Customer (
	CustomerID CHAR(6) NOT NULL,
	CustomerName VARCHAR(70) NOT NULL,
	CustomerEmail VARCHAR(100) NOT NULL,
	CustomerPhNum VARCHAR(32) NOT NULL,
    PRIMARY KEY (CustomerID)
);

CREATE TABLE Review (
	ReviewID CHAR(6) NOT NULL,
	ReviewRating DECIMAL (2,0) NOT NULL,
	ReviewComment VARCHAR(255) NOT NULL,
	ReviewDate DATETIME NOT NULL,
	CustomerID CHAR(6) NULL,
	ChocolateID CHAR(6) NOT NULL,
    PRIMARY KEY (ReviewID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ChocolateID) REFERENCES Chocolate(ChocolateID)
);
-- Once successfully implemented, these insert statements should work.

INSERT INTO Promotion VALUES
	('P01', "Opening Sale", 50.0);

INSERT INTO Category VALUES
	('CAT01', "Ecuador Single Origin", "Cocoa beans from a single Ecuadorian source");

INSERT INTO Chocolate VALUES
	('CHOC13', "Dark Chocolate Tablet", "Small, bite sized dark chocolate tablets", 17.99, 80, 'CAT01');

INSERT INTO Discount VALUES
	('P01', 'CHOC13', '2023-02-01 08:00:00', '2023-02-02 18:00:00');

INSERT INTO Customer VALUES
	('CUS145', "Jon Snow", "j.snow@notreal.com",  "90861923");

INSERT INTO Review VALUES
	('REV131', 8, "A delicious milk chocolate", '2023-02-02 13:22:54', 'CUS145','CHOC13');

-- Please ensure you INSERT atleast 5 records for every table and add it below

-- Inserting additional records into Promotion
INSERT INTO Promotion VALUES ('P02', "Valentine Special", 20.0);
INSERT INTO Promotion VALUES ('P03', "Black Friday", 35.0);
INSERT INTO Promotion VALUES ('P04', "Christmas Discount", 15.0);
INSERT INTO Promotion VALUES ('P05', "Easter Sale", 25.0);
INSERT INTO Promotion VALUES ('P06', "Halloween Offer", 30.0);


-- Inserting additional records into Category
INSERT INTO Category VALUES ('CAT02', "Peru Dark Chocolate", "Rich, dark chocolate from Peru");
INSERT INTO Category VALUES ('CAT03', "Venezuelan Truffle", "Luxury truffles with Venezuelan cacao");
INSERT INTO Category VALUES ('CAT04', "Mixed Variety", "Assortment of different chocolates");
INSERT INTO Category VALUES ('CAT05', "White Chocolate", "Creamy white chocolate made with vanilla beans");
INSERT INTO Category VALUES ('CAT06', "Belgian Milk Chocolate", "Premium Belgian milk chocolate");

-- Inserting additional records into Chocolate
INSERT INTO Chocolate VALUES ('CHOC14', "Milk Chocolate Bar", "Smooth milk chocolate bar", 12.99, 100, 'CAT02');
INSERT INTO Chocolate VALUES ('CHOC15', "White Chocolate Bar", "Vanilla white chocolate", 11.99, 110, 'CAT05');
INSERT INTO Chocolate VALUES ('CHOC16', "Truffle Box", "Assorted truffle box", 25.99, 150, 'CAT03');
INSERT INTO Chocolate VALUES ('CHOC17', "Mixed Chocolate Bag", "Mix of dark, milk, and white chocolates", 22.99, 200, 'CAT04');
INSERT INTO Chocolate VALUES ('CHOC18', "Belgian Chocolate Bar", "Luxurious Belgian milk chocolate bar", 19.99, 120, 'CAT06');

-- Inserting additional records into Discount
INSERT INTO Discount VALUES ('P02', 'CHOC14', '2023-02-10 08:00:00', '2023-02-15 18:00:00');
INSERT INTO Discount VALUES ('P03', 'CHOC15', '2023-11-24 08:00:00', '2023-11-27 18:00:00');
INSERT INTO Discount VALUES ('P04', 'CHOC16', '2023-12-20 08:00:00', '2023-12-25 18:00:00');
INSERT INTO Discount VALUES ('P05', 'CHOC17', '2024-03-28 08:00:00', '2024-04-02 18:00:00');
INSERT INTO Discount VALUES ('P06', 'CHOC18', '2024-10-28 08:00:00', '2024-10-31 18:00:00');


-- Inserting additional records into Customer
INSERT INTO Customer VALUES ('CUS146', "lachlan ", "a.stark@notreal.com", "81234567");
INSERT INTO Customer VALUES ('CUS147', "HOBOjack", "d.targaryen@notreal.com", "81234568");
INSERT INTO Customer VALUES ('CUS148', "MATIN RAssoli", "t.lannister@notreal.com", "81234569");
INSERT INTO Customer VALUES ('CUS149', "DAVIK ", "b.stark@notreal.com", "81234570");
INSERT INTO Customer VALUES ('CUS150', "ERIK ERD", "s.stark@notreal.com", "81234571");

-- Inserting additional records into Review
INSERT INTO Review VALUES ('REV132', 9, "Smooth and creamy", '2023-02-05 11:10:23', 'CUS146', 'CHOC14');
INSERT INTO Review VALUES ('REV133', 7, "A bit too sweet", '2023-02-10 14:45:12', 'CUS147', 'CHOC15');
INSERT INTO Review VALUES ('REV134', 10, "Amazing flavor!", '2023-03-05 10:30:05', 'CUS148', 'CHOC16');
INSERT INTO Review VALUES ('REV135', 6, "Not as good as expected", '2023-03-12 09:22:00', 'CUS149', 'CHOC17');
INSERT INTO Review VALUES ('REV136', 8, "Decent, but a bit pricey", '2023-10-29 12:00:00', 'CUS150', 'CHOC18');



-- Question-B
/* Explain in simple words what each query does and make sure you comment it
 */

-- An example of an answer to a Query

/* This query prints the names of all chocolates */

Select ChocolateName
from Chocolate;




-- Query 1: A query involving a single table with one condition. Insert your answer below

/* Explaination
 FROM Chocolate: This selects the Chocolate table.
 WHERE ChocolatePrice > 15.00: This condition ensures that only chocolates with a price greater than $15.00 are returned.

 Example answer

ChocolateName	        ChocolatePrice
Dark Chocolate Tablet	17.99
Truffle Box.        	25.99
Mixed Chocolate Bag	    22.99
Belgian Chocolate Bar	19.99



 This query selects and displays all chocolates that have a price greater than 15.00
 */
SELECT ChocolateName, ChocolatePrice
FROM Chocolate
WHERE ChocolatePrice > 15.00;




-- Query 2: A query involving a single table with two conditions, with one of the conditions that uses a wild card operator. Insert your answer below

/* Explaination
 FROM Customer: This selects the Customer table.
 WHERE CustomerEmail LIKE '%notreal%': This condition uses the % wildcard to find customers whose email contains the substring "notreal".
 AND CustomerID > 'CUS146': This second condition filters customers whose CustomerID is greater than 'CUS146' (alphabetical order comparison).

 Example answer

CustomerName	CustomerEmail
HOBOjack	    d.targaryen@notreal.com
MATIN RAssoli	t.lannister@notreal.com
DAVIK	        b.stark@notreal.com
ERIK ERD	    s.stark@notreal.com


 This query selects and displays all customers whose email contains 'notreal' and whose CustomerID is greater than 'CUS146'
 */
SELECT CustomerName, CustomerEmail
FROM Customer
WHERE CustomerEmail LIKE '%notreal%' AND CustomerID > 'CUS146';




-- Query 3: A query involving a join between at least two tables with an order by clause. Insert your answer below

/* Explaination
 FROM Discount: We're selecting the Discount table.
 JOIN Chocolate ON Discount.ChocolateID = Chocolate.ChocolateID: This joins the Discount table with the Chocolate table based on the ChocolateID column to get the name of the chocolate.
 ORDER BY Discount.StartDate ASC: This orders the results by the StartDate of the discount in ascending order, so the earliest discounts appear first.

 Example answer

PromotionID	      ChocolateName	           StartDate.  	        EndDate
P01	              Dark Chocolate Tablet	  2023-02-01 08:00:00	2023-02-02 18:00:00
P02	              Milk Chocolate Bar	  2023-02-10 08:00:00	2023-02-15 18:00:00
P04	              Truffle Box	          2023-12-20 08:00:00	2023-12-25 18:00:00
P05	              Mixed Chocolate Bag	  2024-03-28 08:00:00	2024-04-02 18:00:00
P06	              Belgian Chocolate Bar	  2024-10-28 08:00:00	2024-10-31 18:00:00


 This query selects and displays the discount details along with the chocolate names, sorted by the StartDate in ascending order
 */
SELECT Discount.PromotionID, Chocolate.ChocolateName, Discount.StartDate, Discount.EndDate
FROM Discount
JOIN Chocolate ON Discount.ChocolateID = Chocolate.ChocolateID
ORDER BY Discount.StartDate ASC;






-- Query 4: A query involving a single table with an aggregate and group by function. Insert your answer below


/* Explaination
FROM Review: We are selecting the Review table.
 AVG(ReviewRating): This aggregate function calculates the average review rating for each group.
 GROUP BY ChocolateID: This groups the results by ChocolateID, so we get one row per chocolate, showing the average rating for each.

 Example answer

ChocolateID. 	AverageRating
CHOC13	        8.0
CHOC14	        9.0
CHOC15	        7.0
CHOC16	        10.0
CHOC17	        6.0

 This query calculates the average review rating for each chocolate and groups the results by ChocolateID
 */
SELECT ChocolateID, AVG(ReviewRating) AS AverageRating
FROM Review
GROUP BY ChocolateID;
