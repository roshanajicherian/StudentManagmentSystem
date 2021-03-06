-- Inserting data into the student database. 
-- Stored Procedure to insert data into the student database
DROP PROCEDURE IF EXISTS addStudent;
DELIMITER $$ 
CREATE PROCEDURE addStudent(firstNameIn VARCHAR(30),lastNameIn VARCHAR(30),sexIn VARCHAR(1),classIn INT,divsionIn VARCHAR(2),ageIn INT,addressIn VARCHAR(50),phoneIn VARCHAR(13))
BEGIN
	DECLARE EXIT HANDLER FOR 1062
    BEGIN
		SELECT "THe id enterted already exists";
    END;
	INSERT INTO student(studentFirstName,studentLastName,studentSex,studentClass,studentDivision,studentAge,studentAddress,studentPhoneNumber)
	VALUES
    (firstNameIn,lastNameIn,sexIn,classIn,divsionIn,ageIn,addressIn,phoneIn);
END$$
DELIMITER ;

/*CALL addStudent('Rekha','Banerjee','F',10,'A',15,'12-C, 3-A,LIC Lane,Pattom',7417411955);*/