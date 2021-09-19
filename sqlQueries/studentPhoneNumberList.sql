DROP FUNCTION IF EXISTS phoneNumberList;
DELIMITER $$
CREATE FUNCTION phoneNumberList()
RETURNS VARCHAR(3000) DETERMINISTIC
BEGIN 
	DECLARE resultString VARCHAR(3000) DEFAULT "";
    DECLARE tempString VARCHAR(100) DEFAULT "";
    DECLARE notFoundFlag INT DEFAULT 0;
    DECLARE getAllNames CURSOR FOR SELECT studentPhoneNumber from student;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET notFoundFlag=1;
    OPEN getAllNames;
		fetchLoop:LOOP
			SET tempString="";
			FETCH getAllNames INTO tempString;
			IF (notFoundFlag=1 OR tempString="") THEN
				LEAVE fetchLoop;
            END IF;
            IF resultString<>"" THEN
				SET resultString=CONCAT(resultString,", ",tempString);
			ELSE
				SET resultString=CONCAT(resultString,tempString);
            END IF;
        END LOOP fetchLoop;
    CLOSE getAllNames;
    RETURN resultString;
END$$
DELIMITER ;
SELECT phoneNumberList();