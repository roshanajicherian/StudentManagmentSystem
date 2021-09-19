DROP TRIGGER IF EXISTS before_student_delete;
DELIMITER $$
CREATE TRIGGER before_student_delete BEFORE DELETE
ON student
FOR EACH ROW
BEGIN
	DECLARE CONTINUE HANDLER FOR 1062
    BEGIN 
		UPDATE student_backup SET op="DEL" WHERE studentId=OLD.studentId;
    END;
    INSERT INTO student_backup
    (studentId,studentFirstName,studentLastName,studentSex,studentClass,studentDivision,studentAge,studentAddress,studentPhoneNumber,op)
    VALUES
    (OLD.studentId,OLD.studentFirstName,
    OLD.studentLastName,OLD.studentSex,OLD.studentClass,
    OLD.studentDivision,OLD.studentAge,OLD.studentAddress,
    OLD.studentPhoneNumber,"DEL");
END$$
DELIMITER ;