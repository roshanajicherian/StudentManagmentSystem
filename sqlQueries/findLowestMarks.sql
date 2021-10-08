-- Creating the function...

DROP FUNCTION IF EXISTS findLowestMarks;
DELIMITER $$
CREATE FUNCTION findLowestMarks(classId INT, subjectNameIn VARCHAR(30)) RETURNS INT
BEGIN
	DECLARE lowestMarks INT;
	SELECT subjectMarks
    FROM student INNER JOIN studentMarks ON student.studentId = studentMarks.studentId
    WHERE subjectMarks IN
		(SELECT min(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId = studentMarks.studentId
        WHERE (studentClass = classId AND subjectName = subjectNameIn)) AND (studentClass = classId AND subjectName = subjectNameIn)
	INTO lowestMarks;
	RETURN lowestMarks;
END$$
DELIMITER ;

-- Calling the function...

SELECT findLowestMarks(8, 'Maths');



