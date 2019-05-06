use vgu1;

drop table ASSISSTANT;
drop table ENROLL;
drop table TEACH;
drop table SIGN;
drop table REG;
drop table EXAM;
drop table SESSION;
drop table MODULE;
drop table SEMESTER;
drop table LECTURER;
drop table STUDENT;
drop table ACCOUNT;



create table ACCOUNT (
    login varchar(20) unique,
    password varchar(20),
    name varchar(20),
    surname varchar(20),
    accId int NOT NULL AUTO_INCREMENT,
    primary key (accId)
);


create table STUDENT  (
    code varchar(20) unique,
	accId int unique,
    stuId int not null auto_increment,
    primary key (stuId),
    foreign key(accId) references ACCOUNT(accId) ON DELETE CASCADE
);

create table LECTURER(
    accId int unique,
	lecID int NOT NULL AUTO_INCREMENT,
    primary key (lecId),
    foreign key(accId) references ACCOUNT(accId) ON DELETE CASCADE
);

create table ASSISSTANT(
    accId int unique,
    assId int not null auto_increment,
    primary key (assId),
    foreign key(accId) references ACCOUNT(accId) ON DELETE CASCADE
);


create table SEMESTER(
    semFrom date,
    semTo date,
    semId int NOT NULL AUTO_INCREMENT,
    unique(semFrom, semTo),
    primary key(semId)
);

create table MODULE(
    name varchar(30),
    code varchar(20),
    semId int NOT NULL,
    modId int NOT NULL AUTO_INCREMENT,
    foreign key(semId) references SEMESTER(semId) ON DELETE CASCADE,
    unique(semId, code),
    primary key(modId)
);

create table ENROLL(
    stuId int,
    modId int NOT NULL,
    enrollId int NOT NULL AUTO_INCREMENT,
    foreign key(stuId) references STUDENT(stuId) ON DELETE CASCADE,
    foreign key(modId) references MODULE(modId) ON DELETE CASCADE,
    primary key(enrollId),
    unique(stuId, modId)
);


create table TEACH(
    accId int,
    modId int NOT NULL,
    teachId int NOT NULL AUTO_INCREMENT,
    foreign key(accId) references LECTURER(accId) ON DELETE CASCADE,
    foreign key(modId) references MODULE(modId) ON DELETE CASCADE,
    primary key (teachId),
    unique(accId, modId)
);


create table SESSION(
    sesDate date,
    sesFrom time,
    sesTo time,
    modId int NOT NULL,
    sesId int NOT NULL AUTO_INCREMENT,
    foreign key(modId) references MODULE(modId) ON DELETE CASCADE,
    unique(sesDate, sesFrom, sesTo, modId),
    primary key(sesId)
);

create table EXAM(
    deadline date,
	examDate date,
    examFrom time,
    examTo time,
    modId int NOT NULL,
    examId int NOT NULL AUTO_INCREMENT,
    foreign key(modId) references MODULE(modId) ON DELETE CASCADE,
    unique(modId, examDate),
    primary key(examId)
);
/*
create table SIGN(
    sesId int NOT NULL,
    stuId int,
    signTime time,
    signId int NOT NULL AUTO_INCREMENT,
    foreign key(stuId) references STUDENT(stuId) ON DELETE CASCADE,
    foreign key(sesId) references SESSION(sesId) ON DELETE CASCADE,
    primary key(signId),
    unique(sesId, stuId)
);
*/

create table SIGN(
    sesId int NOT NULL,
    stuId int,
    signTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    signId int NOT NULL AUTO_INCREMENT,
    foreign key(stuId) references STUDENT(stuId) ON DELETE CASCADE,
    foreign key(sesId) references SESSION(sesId) ON DELETE CASCADE,
    primary key(signId),
    unique(sesId, stuId)
);

/*
create table REG(
    examId int NOT NULL,
    stuId int,
    regDate date,
    regId int NOT NULL AUTO_INCREMENT,
    foreign key(examId) references EXAM(examId) ON DELETE CASCADE,
    foreign key(stuId) references STUDENT(stuId) ON DELETE CASCADE,
    primary key(regId),
    unique(examId, stuId)
);
*/

create table REG(
    examId int NOT NULL,
    stuId int,
    regDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    regId int NOT NULL AUTO_INCREMENT,
    foreign key(examId) references EXAM(examId) ON DELETE CASCADE,
    foreign key(stuId) references STUDENT(stuId) ON DELETE CASCADE,
    primary key(regId),
    unique(examId, stuId)
);