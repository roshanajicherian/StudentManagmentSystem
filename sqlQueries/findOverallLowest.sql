DROP PROCEDURE IF EXISTS findLowestMarks;
DELIMITER $$
CREATE PROCEDURE findLowestMarks(classIn INT)
BEGIN
	SELECT studentFirstName,studentLastName,studentClass,studentDivision,subjectName,subjectMarks 
	FROM student INNER JOIN studentMarks ON student.studentId=studentMarks.studentId WHERE
	subjectMarks IN 
	(SELECT min(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId=studentMarks.studentId
	WHERE (studentClass=classIn)) AND (studentClass=classIn);
END$$
DELIMITER ;

-- The argument over here will be passed in through the Python file. 
CALL findLowestMarks(8);