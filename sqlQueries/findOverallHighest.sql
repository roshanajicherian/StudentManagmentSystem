DROP PROCEDURE IF EXISTS findHighestMarks;
DELIMITER $$
CREATE PROCEDURE findHighestMarks(classIn INT)
BEGIN
	SELECT studentFirstName,studentLastName,studentClass,studentDivision,subjectName,subjectMarks 
	FROM student INNER JOIN studentMarks ON student.studentId=studentMarks.studentId WHERE
	subjectMarks IN 
	(SELECT max(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId=studentMarks.studentId
	WHERE (studentClass=classIn)) AND (studentClass=classIn);
END$$
DELIMITER ;

-- The argument over here will be passed in through the Python file. 
CALL findHighestMarks(8);
