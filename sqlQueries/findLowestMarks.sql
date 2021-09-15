-- Creating the procedure...

DROP PROCEDURE IF EXISTS findLowestMarks;
DELIMITER $$
CREATE PROCEDURE findLowestMarks(classId INT, subjectNameIn VARCHAR(30))
BEGIN
	SELECT studentFirstName, studentLastname, studentClass, studentDivision, subjectMarks
    FROM student INNER JOIN studentMarks ON student.studentId = studentMarks.studentId
    WHERE subjectMarks IN
		(SELECT min(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId = studentMarks.studentId
        WHERE (studentClass = classId AND subjectName = subjectNameIn)) AND (studentClass = classId AND subjectName = subjectNameIn);
END$$
DELIMITER ;

-- Calling the procedure...

CALL findLowestMarks(8, 'Maths');



