-- Stored Procedure to delete data from the student database
DROP PROCEDURE IF EXISTS deleteStudent;
DELIMITER $$
CREATE PROCEDURE deleteStudent(studentIdIn INT)
BEGIN
	DELETE FROM student WHERE studentId=studentIdIn;
END$$
DELIMITER ;
-- The record to be deleted will be passed in as argumnets from the Python file. 
CALL deleteStudent(16);