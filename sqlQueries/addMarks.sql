DROP PROCEDURE IF EXISTS addMarks;
DELIMITER $$
CREATE PROCEDURE addMarks(studentIdIn INT,subjectName VARCHAR(30),subjectMarks INT)
BEGIN
	DECLARE EXIT HANDLER for 1452
    BEGIN
		-- SELECT("Subject name invalid"); 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="Subject name or student_id invalid";
    END;
	INSERT INTO studentmarks(studentId,subjectName,subjectMarks) 
    VALUES
    (studentIdIn,subjectName,subjectMarks);
END$$
DELIMITER ;