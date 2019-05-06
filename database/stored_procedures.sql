DELIMITER //
DROP PROCEDURE IF EXISTS `AddExam` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddExam`( IN exam_deadline DATE, IN exam_date DATE, IN exam_from TIME,
                             IN exam_to TIME, IN module_id INT)
BEGIN
    INSERT INTO EXAM(deadline, examDate, examFrom, examTo, modId)
    VALUES (exam_deadline, exam_date, exam_from, exam_to, module_id);
END //

DROP PROCEDURE IF EXISTS `AddLecturer` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLecturer`(IN name_login varchar(20), password_account varchar(20), name_account varchar(20), surname_account varchar(20))
BEGIN
	insert into ACCOUNT(login, password, name, surname) values(name_login, password_account, name_account, surname_account);
    insert into LECTURER(accId) values (last_insert_id());
END //

DROP PROCEDURE IF EXISTS `AddModule` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddModule`(IN name_module varchar(30), code_module varchar(20), semester_id int)
BEGIN
	Insert into MODULE(name, code, semId) values(name_module, code_module, semester_id);
END //

DROP PROCEDURE IF EXISTS `AddSemester` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSemester`(IN sem_start DATE, IN sem_end DATE)
BEGIN
	INSERT INTO SEMESTER (semFrom, semTo)
    VALUES (sem_start, sem_end);
END //

DROP PROCEDURE IF EXISTS `AddSession` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddSession`(IN sessiondate date,  sessionfrom time, sessionto time, module_id int)
BEGIN
	insert into SESSION(sesDate, sesFrom, sesTo, modId) values (sessiondate,sessionfrom,sessionto,module_id); 
END //

DROP PROCEDURE IF EXISTS `AddStudent` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddStudent`(IN name_login varchar(20), password_account varchar(20), name_account varchar(20), surname_account varchar(20), code_student varchar(20))
BEGIN
	DECLARE account_id INT DEFAULT 0;
	insert into ACCOUNT(login, password, name, surname) values(name_login, password_account, name_account, surname_account);
	#SELECT A.accId INTO account_id FROM ACCOUNT A WHERE (A.login = name_login);
    insert into STUDENT(code, accId) values (code_student, last_insert_id());
    
    
END //

DROP PROCEDURE IF EXISTS `AllExamsOverlappedInDay` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AllExamsOverlappedInDay`(IN exam_date date)
BEGIN
	SELECT E.modId as modId,  E1.modId as modId1,  E.examFrom, E.examTo
	FROM EXAM E
    JOIN EXAM E1 ON (E.examDate = E1.examDate AND E.modId < E1.modId)
	WHERE E.examDate = exam_date  AND (E.examFrom BETWEEN E1.examFrom AND E1.examTo) ;
END //

DROP PROCEDURE IF EXISTS `AddLecturerToModule` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `AddLecturerToModule`(IN lecturer_id int, IN module_id int)
BEGIN
	INSERT INTO teach (lecId, modId)
        VALUE (lecturer_id, module_id);
END //

DROP PROCEDURE IF EXISTS `CheckAccountExist` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckAccountExist`(IN username varchar(20), pass varchar(20))
BEGIN
	SELECT 1
    FROM account A
    WHERE a.login = username AND a.password = pass;
END //

DROP PROCEDURE IF EXISTS `CheckStudentAttendancesOfModule` //
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckStudentAttendancesOfModule`(IN student_id int, module_id int)
BEGIN
	select a.sesDate, a.sesFrom, a.sesTo, b.stuId
    from   (select s.sesId, sesDate, sesFrom, sesTo
			from session S
			where s.modId = module_id) a
			left join (  select se.sesID, se.sesDate, se.sesFrom, se.sesTo, s.stuId 
						 from student s join sign si on (s.stuId = si.stuId)
						 join session se on (si.sesId = se.sesId)
						 where s.stuId = student_id and modId = module_id ) b on (a.sesId = b.sesId);
END//

DROP PROCEDURE IF EXISTS `ListAllLecturer` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllLecturer`()
BEGIN
	SELECT A.name, A.surname
    FROM account A 
    JOIN Lecturer L ON (A.accId = L.accId);
END //

DROP PROCEDURE IF EXISTS `ListAllLecturersTeachModule` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllLecturersTeachModule`(IN module_id int)
BEGIN
	SELECT A.name, A.surname
	FROM ACCOUNT A 
	JOIN LECTURER L ON (A.accId = L.accId) 
	JOIN TEACH T ON (L.lecId = T.lecId) 
	WHERE T.modId = module_id;
END //

drop procedure if exists `ListAllModules` //
create procedure ListAllModules()
begin
	select M.modId, M.name, M.code, S.semId, S.semFrom, S.semTo
    from module M
		join semester S on (M.semId = S.semId);
end //

DROP PROCEDURE IF EXISTS `ListAllModulesInSemester` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllModulesInSemester`(IN semester_id int)
BEGIN
	SELECT M.name
	FROM MODULE M
	JOIN SEMESTER S ON (M.semId = S.semId)
	WHERE S.semId = semester_id;
END //

DROP PROCEDURE IF EXISTS `ListModulesOfStudent` //
CREATE PROCEDURE ListModulesOfStudent(student_id int)
BEGIN
	select M.name
	from module M
		join enroll E on (E.modID = M.modID)
        join student S on (E.stuID = S.stuID)
        join account A on (S.accID = A.accID)
	where E.stuID = student_id;
END//

DROP PROCEDURE IF EXISTS `ListAllModulesTeacherTeach` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllModulesTeacherTeach`(IN name_lecturer varchar(20))
BEGIN
	SELECT M.name
	FROM MODULE M
	JOIN TEACH T ON (M.modId = T.modId)
    JOIN LECTURER L ON (T.lecId = L.lecId)
    JOIN ACCOUNT A ON (L.accId = A.accId)
	WHERE A.name = name_lecturer;
END //

DROP PROCEDURE IF EXISTS `ListAllSemester` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllSemester`()
BEGIN
	SELECT S.semFrom, S.semTo
    FROM semester S;
END //

DROP PROCEDURE IF EXISTS `ListAllSessionsOfModule` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllSessionsOfModule`(IN module_id INT)
BEGIN
    SELECT S.sesDate, S.sesFrom, S.sesTo
    FROM SESSION S
    WHERE S.modId = module_id;
END //

DROP PROCEDURE IF EXISTS `ListAllStudent` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAllStudent`()
BEGIN
	SELECT A.name, A.surname, S.code
    FROM account A 
    JOIN student S ON (A.accId = S.accId);
END //

DROP PROCEDURE IF EXISTS `ListModule` //

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListModule`(IN module_id int)
BEGIN
	SELECT M.modId,
           M.code,
           M.name,
           semFrom,
           semTo,
           CONCAT(A.name, ' ', A.surname) AS 'lecturer',
           CONCAT(A.accId, '')              AS 'lecturer_id'
    FROM MODULE M
             JOIN semester S on M.semId = S.semId
             JOIN teach T on M.modId = T.modId
             JOIN lecturer L on T.lecId = L.lecId
             JOIN account A on L.accId = A.accId
    WHERE M.modId = module_id;
END //


DROP PROCEDURE IF EXISTS `ListParticipantsOfExam` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListParticipantsOfExam`(IN exam_id INT)
BEGIN
    SELECT S.code, A.name, A.surname
    FROM exam E
             JOIN reg re on E.examId = re.examId
             JOIN student S on re.stuId = S.stuId
             JOIN account A on S.accId = A.accId
    WHERE E.examId  = exam_id;
END //


DROP PROCEDURE IF EXISTS `ListSemester` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListSemester`(IN semester_id int)
BEGIN
	select semFrom, semTo from semester where semId = semester_id;
END //


DROP PROCEDURE IF EXISTS `ListAbsentStudentsOfSession` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAbsentStudentsOfSession`(session_id int)
BEGIN
	select distinct S.stuID, A.name, A.surname
	from session SE
		join enroll E on (SE.modID = E.modID)
		join student S on (E.stuID = S.stuID)
        join account A on (S.accID = A.accID)
	where SE.sesId = session_id and S.stuID not in(
    select distinct S2.stuID
	from student S2
		join sign SI2 on (SI2.stuID = S2.stuID)
		join session SE2 on (SE2.sesID = SI2.sesID)
	where SE2.sesID = session_id);

END //


DROP PROCEDURE IF EXISTS `ListAvailableExam` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListAvailableExam`(IN student_id int, currDate date)
BEGIN
	select m.name, ex.examID, ex.deadline, ex.examDate, ex.examFrom, ex.examTo
    from student s join enroll e on ( s.stuId=e.stuId) 
    join module m on ( e.modId = m.modId) 
    join exam ex on ( ex.modId = m.modId)
    where student_id = s.stuId and currDate < ex.deadline and student_id not in (
		select stuId
		from reg
    );
END //


DROP PROCEDURE IF EXISTS `ListExamsOfSemester` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListExamsOfSemester`(semester_id int)
BEGIN
	select S.semId, E.examId, M.name, E.examDate, E.examFrom, E.examTo
	from exam E
        join module M on (E.modId = M.modId)
        join semester S on (S.semId = M.semId)
	where S.semId = semester_id;
END //


DROP PROCEDURE IF EXISTS `ListModulesOfStudent` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListModulesOfStudent`(IN student_id int)
BEGIN
	select S.stuID, A.name, A.surname, M.name
	from module M
		join enroll E on (E.modID = M.modID)
        join student S on (E.stuID = S.stuID)
        join account A on (S.accID = A.accID)
	where E.stuID = student_id;
END //


DROP PROCEDURE IF EXISTS `ListParticipatedStudentsOfSession` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ListParticipatedStudentsOfSession`(session_id int)
BEGIN
	select S.stuID, A.name, A.surname
	from student S
		join account A on (S.accID = A.accID)
		join sign SI on (SI.stuID = S.stuID)
		join session SE on (SE.sesID = SI.sesID)
	where SE.sesID = session_id;
END //


DROP PROCEDURE IF EXISTS `ModifyAccount` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifyAccount`(IN acc_login VARCHAR(20), IN acc_name VARCHAR(20), IN acc_surname VARCHAR(20), IN acc_id INT)
BEGIN
	UPDATE account A
    SET A.login = acc_login,
        A.name = acc_name,
        A.surname = acc_surname
    WHERE A.accId = acc_id;
END //


DROP PROCEDURE IF EXISTS `ModifyModule` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifyModule`(IN mod_name varchar(30), IN mod_code VARCHAR(20), IN sem_id INT, IN module_id INT)
BEGIN
	UPDATE MODULE M
    SET M.name = mod_name,
        M.code = mod_code ,
        M.semId = sem_id
    WHERE M.modId = module_id;
END //
CALL ModifyModule("HUVILO", "HU", 1, 15)//


DROP PROCEDURE IF EXISTS `ModifySemester` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifySemester`(IN semester_id INT, IN sem_from DATE, IN sem_to DATE)
BEGIN
	UPDATE semester S
    SET S.semFrom = sem_from,
        S.semTo = sem_to 
    WHERE S.semId = semester_id;
END //


DROP PROCEDURE IF EXISTS `ModifySession` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifySession`(IN session_date date, IN session_from time, IN session_to time, IN session_id int)
BEGIN
	UPDATE session S
    SET S.sesDate = session_date,
		S.sesFrom = session_from,
        S.sesTo = session_to 
    WHERE S.sesId = session_id;
END //


DROP PROCEDURE IF EXISTS `ModifyStudent` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `ModifyStudent`(IN acc_login VARCHAR(20), IN acc_name VARCHAR(20), IN acc_surname VARCHAR(20), IN acc_id INT, IN stu_code VARCHAR(20))
BEGIN
    CALL ModifyAccount(acc_login, acc_name, acc_surname, acc_id);
    UPDATE student S
    SET S.code = stu_code
    WHERE S.accId = acc_id;
END //


DROP PROCEDURE IF EXISTS `RegisteredExamsOfStudent` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisteredExamsOfStudent`(IN student_id INT)
BEGIN
    SELECT E.modId, M.name, E.examDate, E.examFrom, E.examTo
    FROM reg RE
             JOIN exam E on RE.examId = E.examId
             JOIN module M on E.modId = M.modId
    WHERE RE.stuId = student_id;
END //


DROP PROCEDURE IF EXISTS `RegisterStudentForExam` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterStudentForExam`(student_id int, exam_id int)
BEGIN
	insert into REG(examId, stuId) values(exam_id, student_id);
END //


DROP PROCEDURE IF EXISTS `DeleteAccount` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteAccount`(IN login_name varchar(20))
BEGIN
	DELETE FROM account
    WHERE login = login_name;
END //


DROP PROCEDURE IF EXISTS `DeleteExam` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExam`(IN exam_id int)
BEGIN
	DELETE 
    FROM exam 
    WHERE examId = exam_id;
END //


DROP PROCEDURE IF EXISTS `DeleteLecturerOfModule` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLecturerOfModule`(IN lec_id int, IN mod_id int)
BEGIN
	DELETE FROM teach
    WHERE lecId = lec_id and modID = mod_id;
END //


drop procedure if exists `DeleteModule` //
create procedure DeleteModule(moduleId int)
begin
	delete
    from module
    where module.modId = moduleId;
end//


DROP PROCEDURE IF EXISTS `DeleteSemester` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSemester`(IN sem_id int)
BEGIN
	DELETE FROM semester
	WHERE semId=sem_id;
END //


DROP PROCEDURE IF EXISTS `DeleteSession` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSession`(IN session_id int)
BEGIN
	DELETE FROM session
	WHERE sesId=session_id;
END //


DROP PROCEDURE IF EXISTS `SignInSession` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `SignInSession`(IN student_id int, IN session_id int)
BEGIN
	INSERT INTO sign (stuId, sesId) VALUE (student_id, session_id);
END //


DROP PROCEDURE IF EXISTS `UnregisterExam` //


CREATE DEFINER=`root`@`localhost` PROCEDURE `UnregisterExam`(IN student_id INT, IN exam_id INT)
BEGIN
    DELETE
    FROM reg
    WHERE stuId = student_id
      AND examId = exam_id;
END //




