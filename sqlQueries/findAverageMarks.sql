-- Creating the function...

DROP FUNCTION IF EXISTS findAverageMarks;
DELIMITER $$
CREATE FUNCTION findAverageMarks(classIn INT, subjectNameIn VARCHAR(30)) RETURNS INT
BEGIN
	DECLARE avgMark INT;
	SELECT avg(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId = studentMarks.studentId 
    WHERE (subjectName = subjectNameIn AND studentClass = classIn)
    INTO avgMark;
    RETURN avgMark;
END$$
DELIMITER ;

-- Calling the procedure

SELECT findAverageMarks(8, 'Maths');


