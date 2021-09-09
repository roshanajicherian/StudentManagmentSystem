USE studentmanagmentsystem;


-- Stored Procedure to find highest marks in a class(irrespective of the section)
DELIMITER $$
CREATE PROCEDURE findHighestMarks(classIn INT,subjectNameIn VARCHAR(20))
BEGIN
	SELECT studentFirstName,studentLastName,studentClass,studentDivision,subjectName,subjectMarks 
	FROM student INNER JOIN studentMarks ON student.studentId=studentMarks.studentId WHERE
	subjectMarks IN 
	(SELECT max(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId=studentMarks.studentId
	WHERE (studentClass=classIn AND subjectName=subjectNameIn)) AND (studentClass=classIn AND subjectName=subjectNameIn);
END$$
DELIMITER ;

-- The argument over here will be passed in through the Python file. 
CALL findHighestMarks(8,'Science')