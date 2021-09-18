-- Stored Procedure to update data of the student database
DROP PROCEDURE IF EXISTS updateStudent;
DELIMITER $$
CREATE PROCEDURE updateStudent
(
studentIdIn INT,
studentFirstNameIn VARCHAR(30),
studentLastNameIn VARCHAR(30),
studentSexIn VARCHAR(1),
studentClassIn INT,
studentDivisionIn VARCHAR(2),
studentAgeIn INT,
studentAddressIn VARCHAR(50),
studentPhoneNumberIn VARCHAR(13)
)
BEGIN
	UPDATE student SET 
	studentFirstName=studentFirstNameIn,
	studentLastName=studentLastNameIn,
	studentSex=studentSexIn,
	studentClass=studentClassIn,
	studentDivision=studentDivisionIn,
	studentAge=studentAgeIn,
	studentAddress=studentAddressIn,
	studentPhoneNumber=studentPhoneNumberIn 
	WHERE studentId=studentIdIn;
END $$
DELIMITER ;
-- The data to be updated will be passed in as argumnets from the Python file. 
CALL updateStudent(1,'Jay','Manohar','M',5,'A',10,'3-A,SFS Courtyard,Pattom,Trivandrum',6238456897);