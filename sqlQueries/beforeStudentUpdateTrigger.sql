DROP TRIGGER IF EXISTS before_student_update;
DROP TRIGGER IF EXISTS before_student_update;
DELIMITER $$
CREATE TRIGGER before_student_update BEFORE UPDATE
ON student
FOR EACH ROW
BEGIN
	DECLARE CONTINUE HANDLER FOR 1062
    BEGIN 
		UPDATE student_backup SET 
        studentFirstName=OLD.studentFirstName,
        studentLastName=OLD.studentLastName,
        studentSex=OLD.studentSex,
        studentClass=OLD.studentClass,
        studentDivision=OLD.studentDivision,
        studentAge=OLD.studentAge,
        studentAddress=OLD.studentAddress,
        studentPhoneNumber=OLD.studentPhoneNumber,
        op="UPD" 
        WHERE studentId=OLD.studentId;
    END;
    INSERT INTO student_backup
    (studentId,studentFirstName,studentLastName,studentSex,studentClass,studentDivision,studentAge,studentAddress,studentPhoneNumber,op)
    VALUES
    (OLD.studentId,OLD.studentFirstName,OLD.studentLastName,
    OLD.studentSex,OLD.studentClass,OLD.studentDivision,
    OLD.studentAge,OLD.studentAddress,OLD.studentPhoneNumber,"UPD");
END$$
DELIMITER ;