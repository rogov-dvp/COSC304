



CREATE TABLE Author (
aid 		int,
aname 	varchar(30),
PRIMARY KEY(aid)
);
CREATE TABLE Ingredient (
iid 	CHAR(5),
iname 	varchar(30),
PRIMARY KEY(iid)
);
CREATE TABLE Recipe (
rid			int,
rname 		varchar(40),
rauthordId 	int,
directions 	varchar(255),
PRIMARY KEY (rid),
FOREIGN KEY(rauthordId) REFERENCES Author(aid) 
ON DELETE SET NULL
ON UPDATE NO ACTION
);
CREATE TABLE Cook (
rid			int,
date_time	DATETIME,
ccomment		varchar(255),
PRIMARY KEY(date_time),
FOREIGN KEY(rid) REFERENCES Recipe(rid)
ON DELETE CASCADE
ON UPDATE CASCADE
);
CREATE TABLE Requires (
	rid			int,
    iid			CHAR(5),
    amount		float,
    FOREIGN KEY(rid) REFERENCES Recipe(rid)
	ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(iid) REFERENCES Ingredient(iid)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO	Author(aid,aname)
VALUES(1,'Joe Smith'),(2,'Fred Funk');
INSERT INTO Ingredient(iid,iname)
VALUES('BUTTR','Butter'),('FLOUR','Flour'),('MILK','Milk'),('EGGS','Eggs'),('SUGAR','Sugar');
INSERT INTO Recipe(rid,rname,rauthordId,directions)
VALUES(100,'Cookies',1,'Mix butter, flour, milk, eggs, and sugar. Then hope for the best.'),(200,'Bread',2,'Knead flour with milk and eggs. Bake at 450F or until brown.');
INSERT INTO Requires(rid,iid,amount)
VALUES(100,'BUTTR',10),('100','MILK',2),('100','EGGS',4),('100','SUGAR',1),('200','FLOUR',3),('200','MILK',3),('200','EGGS',4);
INSERT INTO Cook(rid,date_time,ccomment)
VALUES('200','2015/07/01',''),('100','2015/09/23 13:35:45','It actually worked!');

DELETE FROM Recipe
WHERE rauthorID=2;
-- ANSWER: 1 tuples are deleted from Recipe. 3 tuples are deleted from Requires. 1 tuple is deleted from cook. 5 total tupules deleted 

UPDATE Ingredient
SET  iname = 'Skim Milk'
WHERE iid ='MLIK';	



