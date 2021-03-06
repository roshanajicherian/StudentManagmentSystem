-- Creating A DATABASE FOR THE PROJECT

CREATE database StudentManagmentSystem;
USE StudentManagmentSystem;


-- CREATING TABLE STUDENT
CREATE TABLE student (
    studentId INT PRIMARY KEY AUTO_INCREMENT,
    studentFirstName VARCHAR(30) NOT NULL,
    studentLastName VARCHAR(30) NOT NULL,
    studentSex VARCHAR(1) NOT NULL,
    studentClass INT NOT NULL,
    studentDivision VARCHAR(2) NOT NULL,
    studentAge INT NOT NULL,
    studentAddress VARCHAR(50),
    studentPhoneNumber VARCHAR(13) UNIQUE,
    CHECK (studentSex='M' OR studentSex='F')
);
-- CREATING TABLE STUDENT
CREATE TABLE studentMarks(
markId INT PRIMARY KEY AUTO_INCREMENT,
studentId INT NOT NULL,
subjectName VARCHAR(30),
subjectMarks INT,
FOREIGN KEY studentMarks(studentId) REFERENCES student(studentId),
FOREIGN KEY stuentMarks(subjectName) REFERENCES subjectNames(subjectName),
CHECK (subjectMarks>=0 AND subjectMarks<=100)
);


-- INSERTING VALUES INTO student
INSERT INTO student(studentFirstName,studentLastName,studentSex,studentClass,studentDivision,studentAge,studentAddress,studentPhoneNumber)
VALUES 
('Ravi','Manohar','M',5,'A',10,'3-A,SFS Courtyard,Pattom,Trivandrum',6238456897),
('Ken','Mathew','M',10,'B',15,'5-B,Jawahar Nagar,Kowdiar,Trivandrum',9946285691),
('Arun','Pandey','M',8,'C',13,'17-A,Sree Nagar,Kesavadasapuram,Trivandrum',7245856897),
('Akshat','Jain','M',9,'A',14,'15-B,LIC Nagar,Pattom,Trivandrum',8589621215),
('Divyansh','Kumar','M',10,'B',15,'5-B,PPD Seasons,Kowdiar',9895693120),
('Parkash','Agarwal','M',11,'B',16,'15-A,Vikas Nagar,Pattom,Trivandrum',8569123458),
('Jerry','John','M',8,'13',11,'32-A,Artech Luxe,Keston Road,Trivandrum',8569741325),
('Salman','S','M',3,'B',8,'06-C,Pandits Colony,Ullor,Trivandrum',6842456974),
('Jeff','Thomas','M',3,'C',8,'13-C,LIC Nagar,Pattom,Trivandrum',8523649762),
('Harshavardhan','Sha','F',4,'B',9,'6-B,Malabar Urbanscape,Near Golf Links,Trivandrum',8545741325),
('Riya','Chhavi','F',4,'D',9,'13-B,Mummys Lane, Kowdiar,Trivandrum',8545774125),
('Karishma','Roy','F',5,'B',10,'5-C,Sree Dhanya Serene,Akkulam Lakeside,Trivandrum',8523693120),
('Parpti','Jain','F',7,'C',12,'2-A,Vyasa Nagar,Kesavadasapuram,Trivandrum',6279593120),
('Angela','Roy','F',7,'A',12,'12-C,Microwave Colony,Ulloor',8569742365),
('Diya','Birla','F',10,'B',15,'13-A, Christ Nagar Colony,Kowdiar',7413321955);


-- INSERTING VALUES INTO studentMarks
INSERT INTO studentMarks(studentId,subjectName,subjectMarks) VALUES
(1,'Maths',83),
(1,'Science',73),
(1,'Social Science',52),
(2,'Maths',85),
(2,'Science',93),
(2,'Social Science',62),
(3,'Maths',75),
(3,'Science',87),
(3,'Social Science',55),
(4,'Maths',63),
(4,'Science',23),
(4,'Social Science',13),
(5,'Maths',93),
(5,'Science',53),
(5,'Social Science',63),
(6,'Maths',93),
(6,'Science',100),
(6,'Social Science',52),
(7,'Maths',59),
(7,'Science',74),
(7,'Social Science',62),
(8,'Maths',88),
(8,'Science',97),
(8,'Social Science',21),
(9,'Maths',32),
(9,'Science',15),
(9,'Social Science',44),
(10,'Maths',64),
(10,'Science',81),
(10,'Social Science',27),
(11,'Maths',64),
(11,'Science',38),
(11,'Social Science',84),
(12,'Maths',78),
(12,'Science',56),
(12,'Social Science',52),
(12,'Maths',90),
(13,'Science',53),
(13,'Social Science',52),
(13,'Maths',84),
(14,'Science',72),
(14,'Social Science',53),
(14,'Maths',55),
(15,'Science',15),
(15,'Social Science',63),
(15,'Maths',83);

-- Creating subject names table
CREATE TABLE subjectNames(subjectName VARCHAR(30) PRIMARY KEY NOT NULL);
INSERT INTO subjectNames(subjectName) VALUES 
('Maths'),
('Science'),
('Social Science'),
('English'),
('Biology'),
('Chemistry'),
('Physics');


-- Creating student_backup table
CREATE TABLE student_backup
(
    studentId INT PRIMARY KEY,
    studentFirstName VARCHAR(30) NOT NULL,
    studentLastName VARCHAR(30) NOT NULL,
    studentSex VARCHAR(1) NOT NULL,
    studentClass INT NOT NULL,
    studentDivision VARCHAR(2) NOT NULL,
    studentAge INT NOT NULL,
    studentAddress VARCHAR(50),
    studentPhoneNumber VARCHAR(13) UNIQUE,
	op VARCHAR(10) NOT NULL,
    opTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP(),
    CHECK (studentSex='M' OR studentSex='F')
);