DELIMITER //
DROP PROCEDURE IF EXISTS ListExamsOfSemester;
CREATE PROCEDURE ListExamsOfSemester(semester_id int)
BEGIN
	select S.semId, E.examId, M.name, E.examDate, E.examFrom, E.examTo
	from exam E
        join module M on (E.modId = M.modId)
        join semester S on (S.semId = M.semId)
	where S.semId = semester_id;
END //
CALL ListExamsOfSemester(1)//


DELIMITER //
DROP PROCEDURE IF EXISTS ListModulesOfStudent;
CREATE PROCEDURE ListModulesOfStudent(student_id int)
BEGIN
	select S.stuID, A.name, A.surname, M.name
	from module M
		join enroll E on (E.modID = M.modID)
        join student S on (E.stuID = S.stuID)
        join account A on (S.accID = A.accID)
	where E.stuID = student_id;
END//
CALL ListModulesOfStudent(2)//

DELIMITER //
DROP PROCEDURE IF EXISTS ListParticipatedStudentsOfSession;
CREATE PROCEDURE ListParticipatedStudentsOfSession(session_id int)
BEGIN
	select S.stuID
	from student S
		join sign SI on (SI.stuID = S.stuID)
		join session SE on (SE.sesID = SI.sesID)
	where SE.sesID = session_id;
END//
CALL ListParticipatedStudentsOfSession(1)//


DELIMITER //
DROP PROCEDURE IF EXISTS ListAbsentStudentsOfSession;
CREATE PROCEDURE ListAbsentStudentsOfSession(session_id int)
BEGIN
	select distinct S.stuID
	from session SE
		join enroll E on (SE.modID = E.modID)
		join student S on (E.stuID = S.stuID)
	where SE.sesId = session_id and S.stuID not in(
    select distinct S2.stuID
	from student S2
		join sign SI2 on (SI2.stuID = S2.stuID)
		join session SE2 on (SE2.sesID = SI2.sesID)
	where SE2.sesID = session_id);

END//
CALL ListAbsentStudentsOfSession(1) //





DELIMITER //
DROP PROCEDURE IF EXISTS ListRegisteredStudentsOfExam;
CREATE PROCEDURE ListRegisteredStudentsOfExam(exam_id int)
BEGIN
	select S.stuID
	from student S
		join reg R on (R.stuID = S.stuID)
	where R.examID = exam_id;
END//
CALL ListRegisteredStudentsOfExam(2)//


DELIMITER //
DROP PROCEDURE IF EXISTS RegisterStudentForExam;
CREATE PROCEDURE RegisterStudentForExam(student_id int, exam_id int)
BEGIN
	insert into REG(examId, stuId, regDate) values(student_id, exam_id, curdate());
END//
CALL RegisterStudentForExam(5, 2)//


DELIMITER //
DROP PROCEDURE IF EXISTS SignStudentForSession;
CREATE PROCEDURE SignStudentForSession(student_id int, session_id int)
BEGIN
	insert into SIGN(sesId, stuId, signTime) values(session_id, student_id, curtime());
END//
CALL SignStudentForSession(3, 4)//


DELIMITER //
DROP PROCEDURE IF EXISTS AddSessionToModule;
CREATE PROCEDURE AddSessionToModule(session_date DATE, session_from TIME, session_to TIME, module_id int)
BEGIN
	insert into SESSION(sesDate, sesFrom, sesTo, modId) values(session_date, session_from, session_to, module_id);
END//
CALL AddSessionToModule('2018-05-04', '09:00:00', '10:30:00', 3)//


DELIMITER //
DROP PROCEDURE IF EXISTS AddSemester;
CREATE PROCEDURE AddSemester(semester_from date, semester_to date)
BEGIN
	insert into SEMESTER(semFrom, semTo) values(semester_from, semester_to);
END//
CALL AddSemester('2022-01-01', '2022-05-31')//


DELIMITER //
DROP PROCEDURE IF EXISTS AddStudentToModule;
CREATE PROCEDURE AddStudentToModule(student_id int, module_id int)
BEGIN
	insert into ENROLL(stuId, modId) values(student_id, module_id);
END//
CALL AddStudentToModule(5, 3)//


DELIMITER //
DROP PROCEDURE IF EXISTS AddModule;
CREATE PROCEDURE AddModule(module_name varchar(30), module_code varchar(20), semester_id int)
BEGIN
	insert into MODULE(name, code, semId) values(module_name, module_code, semester_id);
END//
CALL AddModule('Computer Network', 'COMPNET', 3)//

