DROP PROCEDURE IF EXISTS findAverageMarks;
DELIMITER $$
CREATE PROCEDURE findAverageMarks(classIn INT, subjectNameIn VARCHAR(30))
BEGIN
	SELECT studentClass, subjectName, avg(subjectMarks) FROM student INNER JOIN studentMarks ON student.studentId = studentMarks.studentId WHERE (subjectName = subjectNameIn AND studentClass = classIn);
END$$
DELIMITER ;
CALL findAverageMarks(8, 'Maths');


