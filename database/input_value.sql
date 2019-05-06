delimiter //
drop procedure if exists TruncateAll//
create procedure TruncateAll()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	truncate table ASSISSTANT;
	truncate table ENROLL;
	truncate table TEACH;
	truncate table SIGN;
	truncate table REG;	
	truncate table EXAM;
	truncate table SESSION;
	truncate table MODULE;
	truncate table SEMESTER;
	truncate table LECTURER;
	truncate table STUDENT;
	truncate table ACCOUNT;
    SET FOREIGN_KEY_CHECKS=1;
END //
CALL TruncateAll()//

drop procedure if exists InitializeInstances//
create procedure InitializeInstances()
begin
#insert account

insert into ACCOUNT(login, password, name, surname) values('trang', '123456', 'Trang', 'Nguyen');
insert into ACCOUNT(login, password, name, surname) values('manuel', '123456', 'Clavel', 'Manuel');
insert into ACCOUNT(login, password, name, surname) values('tuan', '123456', 'Tuan', 'Do');
insert into ACCOUNT(login, password, name, surname) values('thong', '123456', 'Thong', 'Quach');
insert into ACCOUNT(login, password, name, surname) values('tri', '123456', 'Tri', 'Tri');
insert into ACCOUNT(login, password, name, surname) values('trung', '123456', 'Trung', 'Do');
insert into ACCOUNT(login, password, name, surname) values('logofatu', '123456', 'doina', 'logofatu');
insert into ACCOUNT(login, password, name, surname) values('anh', '123456', 'Anh', 'Bui');
insert into ACCOUNT(login, password, name, surname) values('hung', '123456', 'Hung', 'Nguyen');
insert into ACCOUNT(login, password, name, surname) values('hung2', '123456', 'Hung', 'Duong');
insert into ACCOUNT(login, password, name, surname) values('hung3', '123456', 'Hung', 'Vu');
insert into ACCOUNT(login, password, name, surname) values('dat', '123456', 'Dat', 'Ho');
insert into ACCOUNT(login, password, name, surname) values('dat2', '123456', 'Dat', 'Nguyen');
insert into ACCOUNT(login, password, name, surname) values('minh', '123456', 'Minh', 'Nguyen');



#insert roles

insert into STUDENT(code ,accId) values('01', 3);
insert into STUDENT(code ,accId) values('02', 4);
insert into STUDENT(code ,accId) values('03', 5);
insert into STUDENT(code ,accId) values('04', 6);
insert into STUDENT(code ,accId) values('05', 8);
insert into STUDENT(code ,accId) values('06', 9);
insert into STUDENT(code ,accId) values('07', 10);
insert into STUDENT(code ,accId) values('08', 11);
insert into STUDENT(code ,accId) values('09', 12);
insert into STUDENT(code ,accId) values('010', 13);

insert into ASSISSTANT(accId)   values(1);

insert into LECTURER(accId) values(2);
insert into LECTURER(accId) values(7);
insert into LECTURER(accId) values(14);


#insert semester

insert into SEMESTER(semFrom, semTo) values('2018-01-01','2018-05-31'); #1
insert into SEMESTER(semFrom, semTo) values('2018-06-01','2018-12-31'); #2
insert into SEMESTER(semFrom, semTo) values('2019-01-01','2019-05-31'); #3
insert into SEMESTER(semFrom, semTo) values('2019-06-01','2019-12-31'); #4
insert into SEMESTER(semFrom, semTo) values('2020-01-01','2020-05-31'); #5
insert into SEMESTER(semFrom, semTo) values('2020-06-01','2020-12-31'); #6 
insert into SEMESTER(semFrom, semTo) values('2021-01-01','2021-05-31'); #7
insert into SEMESTER(semFrom, semTo) values('2021-06-01','2021-12-31'); #8


#insert module

insert into MODULE(name, code, semId) values('Database', 'DB', 1); #1
insert into MODULE(name, code, semId) values('Software', 'SWE', 1);
insert into MODULE(name, code, semId) values('Java', 'JAVA', 1);
insert into MODULE(name, code, semId) values('Statistics', 'STATS', 1);
insert into MODULE(name, code, semId) values('C Programming', 'C', 2);
insert into MODULE(name, code, semId) values('Math', 'MATH', 2);
insert into MODULE(name, code, semId) values('Discrete Math', 'DMATH', 3);
insert into MODULE(name, code, semId) values('Statistics', 'STATS', 3);
insert into MODULE(name, code, semId) values('Auto Chess', 'AUCH', 1);
insert into MODULE(name, code, semId) values('Bussiness Administration', 'BA', 2);
insert into MODULE(name, code, semId) values('Theoretical Computing', 'THCOMP', 4);
insert into MODULE(name, code, semId) values('Computer Architecture', 'CPARCH', 5);
insert into MODULE(name, code, semId) values('Intro to Game programming', 'INGAME', 6);
insert into MODULE(name, code, semId) values('Intro to Machine Learning', 'INML', 7);
insert into MODULE(name, code, semId) values('Intro to Deep Learning', 'INDL', 8); #15

#insert enroll

insert into ENROLL(stuId, modId) values(1, 1);
insert into ENROLL(stuId, modId) values(1, 2);
insert into ENROLL(stuId, modId) values(1, 3);
insert into ENROLL(stuId, modId) values(2, 1);
insert into ENROLL(stuId, modId) values(3, 1);
insert into ENROLL(stuId, modId) values(4, 1);
insert into ENROLL(stuId, modId) values(5, 1);
insert into ENROLL(stuId, modId) values(2, 4);
insert into ENROLL(stuId, modId) values(2, 5);
insert into ENROLL(stuId, modId) values(2, 6);
insert into ENROLL(stuId, modId) values(3, 7);
insert into ENROLL(stuId, modId) values(3, 8);
insert into ENROLL(stuId, modId) values(4, 9);
insert into ENROLL(stuId, modId) values(4, 10);
insert into ENROLL(stuId, modId) values(4, 11);
insert into ENROLL(stuId, modId) values(5, 12);
insert into ENROLL(stuId, modId) values(5, 13);
insert into ENROLL(stuId, modId) values(5, 14);
insert into ENROLL(stuId, modId) values(5, 15);
insert into ENROLL(stuId, modId) values(6, 1);
insert into ENROLL(stuId, modId) values(6, 2);
insert into ENROLL(stuId, modId) values(6, 3);
insert into ENROLL(stuId, modId) values(7, 4);
insert into ENROLL(stuId, modId) values(7, 5);
insert into ENROLL(stuId, modId) values(7, 6);
insert into ENROLL(stuId, modId) values(8, 7);
insert into ENROLL(stuId, modId) values(8, 8);
insert into ENROLL(stuId, modId) values(8, 9);
insert into ENROLL(stuId, modId) values(9, 10);
insert into ENROLL(stuId, modId) values(9, 11);
insert into ENROLL(stuId, modId) values(9, 12);
insert into ENROLL(stuId, modId) values(10, 13);
insert into ENROLL(stuId, modId) values(10, 14);
insert into ENROLL(stuId, modId) values(10, 15);



#insert teach

insert into TEACH(accId, modId) values (2, 1);
insert into TEACH(accId, modId) values (2, 2);
insert into TEACH(accId, modId) values (2, 3);
insert into TEACH(accId, modId) values (2, 4);
insert into TEACH(accId, modId) values (7, 5);
insert into TEACH(accId, modId) values (7, 6);
insert into TEACH(accId, modId) values (7, 7);
insert into TEACH(accId, modId) values (7, 8);
insert into TEACH(accId, modId) values (14, 9);
insert into TEACH(accId, modId) values (14, 10);
insert into TEACH(accId, modId) values (14, 11);
insert into TEACH(accId, modId) values (14, 12);
insert into TEACH(accId, modId) values (14, 13);
insert into TEACH(accId, modId) values (14, 14);
insert into TEACH(accId, modId) values (14, 15);


#insert session

insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '09:00:00', '12:00:00', 1); #1
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '13:00:00', '16:00:00', 1); #2
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-02', '09:00:00', '12:00:00', 1);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-02', '13:00:00', '16:00:00', 1);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-03', '09:00:00', '12:00:00', 1);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-03', '13:00:00', '16:00:00', 1);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '09:00:00', '12:00:00', 2);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '13:00:00', '16:00:00', 2);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-02', '09:00:00', '12:00:00', 2);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-02', '13:00:00', '16:00:00', 2);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-02-01', '13:00:00', '16:00:00', 3);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-02-02', '13:00:00', '16:00:00', 3);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-03-02', '13:00:00', '16:00:00', 4);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-04-02', '13:00:00', '16:00:00', 4);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '09:00:00', '12:00:00', 5);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '13:00:00', '16:00:00', 5);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '09:00:00', '12:00:00', 6);
insert into SESSION(sesDate, sesFrom, sesTo, modId) values ('2018-01-01', '13:00:00', '16:00:00', 6);

#insert exam

insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '09:00:00', '10:30:00', 1);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '09:00:00', '10:30:00', 2);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '09:00:00', '10:30:00', 3);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-10', '2018-05-13', '09:00:00', '10:30:00', 4);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-10', '2018-05-13', '10:30:00', '12:00:00', 5);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '09:00:00', '10:30:00', 6);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '10:00:00', '12:00:00', 7);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '09:00:00', '10:30:00', 9);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-28', '09:00:00', '11:30:00', 8);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-25', '2018-05-25', '09:00:00', '10:30:00', 9);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-15', '2018-05-18', '09:00:00', '10:30:00', 10);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-17', '2018-05-20', '09:00:00', '10:30:00', 11);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-17', '2018-05-20', '11:00:00', '12:30:00', 12);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-18', '2018-05-21', '09:00:00', '10:30:00', 13);
insert into EXAM(deadline, examDate, examFrom, examTo, modId) values ('2018-05-18', '2018-05-21', '09:00:00', '10:30:00', 14);


#insert sign
#insert into SIGN(sesId, stuId, signTime) values (1, 1, '09:00:00');
#insert into SIGN(sesId, stuId, signTime) values (1, 3, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (1, 2, '13:00:00');
insert into SIGN(sesId, stuId, signTime) values (1, 4, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (1, 5, '09:00:00');
#insert into SIGN(sesId, stuId, signTime) values (1, 6, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (3, 3, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (4, 6, '13:00:00');
insert into SIGN(sesId, stuId, signTime) values (5, 7, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (6, 7, '13:00:00');
insert into SIGN(sesId, stuId, signTime) values (7, 3, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (7, 4, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (7, 5, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (7, 6, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (7, 7, '09:00:00');
insert into SIGN(sesId, stuId, signTime) values (8, 8, '09:00:00');


#insert sign
/*
insert into SIGN(sesId, stuId) values (1, 3);
insert into SIGN(sesId, stuId) values (2, 3);
insert into SIGN(sesId, stuId) values (1, 4);
insert into SIGN(sesId, stuId) values (1, 5);
insert into SIGN(sesId, stuId) values (1, 6);
insert into SIGN(sesId, stuId) values (3, 3);
insert into SIGN(sesId, stuId) values (4, 6);
insert into SIGN(sesId, stuId) values (5, 7);
insert into SIGN(sesId, stuId) values (6, 7);
insert into SIGN(sesId, stuId) values (7, 3);
insert into SIGN(sesId, stuId) values (7, 4);
insert into SIGN(sesId, stuId) values (7, 5);
insert into SIGN(sesId, stuId) values (7, 6);
insert into SIGN(sesId, stuId) values (7, 7);
insert into SIGN(sesId, stuId) values (8, 8);
*/

#insert REG

insert into REG(examId, stuId, regDate) values(1, 3, '2018-05-20');
insert into REG(examId, stuId, regDate) values(1, 4, '2018-05-20');
insert into REG(examId, stuId, regDate) values(1, 5, '2018-05-20');
insert into REG(examId, stuId, regDate) values(2, 3, '2018-05-20');
insert into REG(examId, stuId, regDate) values(5, 4, '2018-05-21');
insert into REG(examId, stuId, regDate) values(5, 5, '2018-05-21');
insert into REG(examId, stuId, regDate) values(6, 6, '2018-05-22');
insert into REG(examId, stuId, regDate) values(7, 7, '2018-05-23');
insert into REG(examId, stuId, regDate) values(8, 8, '2018-05-24');
insert into REG(examId, stuId, regDate) values(9, 9, '2018-05-25');
insert into REG(examId, stuId, regDate) values(10, 10, '2018-05-26');

#insert REG
/*
insert into REG(examId, stuId) values(1, 3);
insert into REG(examId, stuId) values(1, 4);
insert into REG(examId, stuId) values(1, 5);
insert into REG(examId, stuId) values(2, 3);
insert into REG(examId, stuId) values(5, 4);
insert into REG(examId, stuId) values(5, 5);
insert into REG(examId, stuId) values(6, 6);
insert into REG(examId, stuId) values(7, 7);
insert into REG(examId, stuId) values(8, 8);
insert into REG(examId, stuId) values(9, 9);
insert into REG(examId, stuId) values(10, 10);
*/
end//
call InitializeInstances()//
