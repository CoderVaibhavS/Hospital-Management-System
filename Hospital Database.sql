-- create hospital database
CREATE DATABASE hospital;
USE hospital;

-- tables definitions 
CREATE TABLE patient (
patient_id CHAR(5) NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
sex CHAR(6) NOT NULL,
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000));

CREATE TABLE doctor (
doctor_id CHAR(5) NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
sex CHAR(6) NOT NULL,
specialisation varchar(15) NOT NULL,
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000));

CREATE TABLE staff (
staff_id CHAR(5) NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
sex CHAR(6) NOT NULL,
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000),
salary BIGINT NOT NULL);

CREATE TABLE room (
room_no INT NOT NULL PRIMARY KEY,
status CHAR(6) NOT NULL,
patient_id CHAR(5),
staff_id CHAR(5),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (staff_id) REFERENCES staff(staff_id));

CREATE TABLE records (
patient_id CHAR(5) NOT NULL,
record_no INT NOT NULL,
date_of_examination DATE NOT NULL,
problem VARCHAR(255) NOT NULL,
PRIMARY KEY (patient_id, record_no),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id));

CREATE TABLE appointment (
patient_id CHAR(5) NOT NULL,
doctor_id CHAR(5) NOT NULL,
appointment_id CHAR(5) NOT NULL PRIMARY KEY,
apt_date DATE NOT NULL,
apt_time TIME NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE diagnosis (
diagnosis_id CHAR(5) NOT NULL PRIMARY KEY,
patient_id CHAR(5) NOT NULL,
doctor_id CHAR(5) NOT NULL,
result VARCHAR(255) NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE bill (
receipt_no INT NOT NULL PRIMARY KEY,
appointment_id CHAR(5) NOT NULL,
pmt_date DATE NOT NULL,
amount FLOAT NOT NULL,
FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id));

CREATE TABLE pays (
receipt_no INT NOT NULL PRIMARY KEY,
patient_id CHAR(5) NOT NULL,
FOREIGN KEY (receipt_no) REFERENCES bill(receipt_no),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id));



insert into patient values ( 1241, 'Sanjeev' , 20 , 'male' ,8757740706);
insert into patient values ( 1311, 'Vaibhav' , 29 , 'male' ,9767778987);
insert into patient values ( 1411, 'Urvashi' , 34 , 'female' ,9757740777);
insert into patient values ( 1512, 'Anirudh' , 43, 'male' ,6957740756);
insert into patient values ( 1613, 'Adya' , 54 , 'female' ,6787740799);
insert into patient values ( 1714, 'Jay' , 71 , 'male' ,8750007026);
insert into patient values ( 1815, 'Adrija' , 47 , 'female' ,8657440760);
insert into patient values ( 2114, 'Aliya' , 12 , 'female' ,7797740768);
insert into patient values ( 1915, 'Harsh' , 67 , 'male' ,7757748806);
insert into patient values ( 7143, 'Akash' , 45 , 'male' ,9877740706);
insert into patient values ( 2132, 'Purvi' , 13 , 'female' ,8757706876);
insert into patient values ( 1243, 'Deepak' , 19 , 'male' ,8757890769);
insert into patient values ( 1156, 'Shreya' , 78 , 'female' ,7740707656);
insert into patient values ( 1121, 'Kavin' , 64 , 'male' ,7896547078);
insert into patient values ( 3016, 'Atharv' , 35 , 'male' ,7434242306);
insert into patient values ( 3115, 'Priyanka' , 39 , 'female' ,8757894098);
insert into patient values ( 3213, 'Tanisha' , 41 , 'female' ,7466707706);
insert into patient values ( 3316, 'Anshika' , 53 , 'female' ,9878778706);
insert into patient values ( 5619, 'Aditya' , 25 , 'male' ,9875740768);
insert into patient values ( 7810, 'Aryan' , 17 , 'others' ,8897740709);
insert into patient values ( 8712, 'Ojas' , 58 , 'male' ,7898706766);
insert into patient values ( 5413, 'Kriti' , 46 , 'female' ,9994070665);
insert into patient values ( 1113, 'Sourav' , 22 , 'male' ,8997740886);
insert into patient values ( 2224, 'Lavanya' , 26 , 'female' ,7574006877);
insert into patient values ( 1295, 'Mrinal' , 47 , 'others' ,9999070676);
insert into patient values ( 2718, 'Deepika' , 92 , 'female' ,9898675676);
insert into patient values ( 3123, 'Pratyush' , 83 , 'male' ,6787656786);
insert into patient values ( 4578, 'Anushka' , 36 , 'female' ,6350602942);
insert into patient values ( 7535, 'Apul' , 55 , 'male' ,8987663170);
insert into patient values ( 9998, 'Sheetal' , 42 , 'female' ,8987880656);
insert into doctor values (121,'Vikas',40,'male', 'heart' ,8293445689,5000000);
insert into doctor values (231,'Suman',40,'female', 'skin' ,6355667987,4500000);
insert into doctor values (441,'Apurv',40,'male', 'brain' ,9987878735,7600000);
insert into doctor values (765,'Bhavna',40,'female', 'neuro' ,8987445690,10000000);
insert into doctor values (284,'Tanmay',40,'male', 'stomach' ,7760895585,8900000);
insert into doctor values (197,'Virat',40,'male', 'dental' ,9834567894,4400000);
insert into staff values (34,'Tony',24,'male',7787646568,340000);
insert into staff values (45,'Ravi',24,'male',8997646568,540000);
insert into staff values (67,'Mohan',24,'male',7797646999,230000);
insert into staff values (98,'Varun',24,'male',9987646568,120000);
insert into staff values (51,'Ritik',24,'male',7887666688,330000);
insert into staff values (69,'Sakshi',24,'female',8987646689,620000);
insert into staff values (12,'Umang',24,'male',6587646566,390000);
insert into staff values (32,'Rohan',24,'male',9887646577,370000);
insert into staff values (38,'Navya',24,'female',7667647996,510000);
insert into staff values (84,'Bharti',24,'female',6998607087,210000);
insert into staff values (27,'Manas',24,'male',7978776579,840000);
insert into staff values (44,'Akshat',24,'male',9898999642,440000);
insert into room values (1,'free',1411, 67);
insert into room values (6,'booked',2132, 98);
insert into room values (4,'free',1311, 51);
insert into room values (3,'booked',1512, 12);
insert into room values (7,'free',5413, 32);
insert into room values (9,'free',1113, 84);
insert into room values (2,'free',2224, 27);
insert into room values (5,'booked',1295, 44);
insert into room values (8,'free',2718, 45);
insert into room values (10,'free',9998, 69);
insert into records values (1241,1,'2022-04-013','cough problem');
insert into records values (1241,2,'2023-07-23','blood pressure');
insert into records values (1311,1,'2021-08-14','heart problem');
insert into records values (1411,1,'2022-02-05','lung problem');
insert into records values (1512,1,'2020-10-28','skin problem');
insert into records values (1512,2,'2022-04-19','liver problem');
insert into records values (1512,3,'2023-03-12','blood pressure');
insert into records values (1613,1,'2022-04-30','skin problem');
insert into records values (1714,1,'2022-04-12','blood pressure');
insert into records values (1815,1,'2022-05-07','stomach ache');
insert into records values (1815,2,'2023-09-06','cough problem');
insert into records values (2114,1,'2023-01-09','stomach ach');
insert into records values (1915,1,'2023-01-13','blood pressure');
insert into records values (7143,1,'2022-11-23','liver problem');
insert into records values (2132,1,'2022-12-26','cough problem');
insert into records values (2132,2,'2023-02-24','heart problem');
insert into records values (1243,1,'2021-05-06','eye problem');
insert into records values (1156,1,'2020-06-30','dental problem');
insert into records values (1121,1,'2021-07-21','skin problem');
insert into records values (1121,2,'2022-07-24','cough problem');
insert into records values (1121,3,'2023-03-05','liver problem');
insert into records values (3016,1,'2023-04-04','heart problem');
insert into records values (3115,1,'2023-09-03','stomach ache');
insert into records values (3213,1,'2022-10-10','cough problem');
insert into records values (3213,2,'2023-08-15','skin problem');
insert into records values (3316,1,'2023-04-14','lung problem');
insert into records values (5619,1,'2023-06-23','dental problem');
insert into records values (7810,1,'2021-08-17','blood pressure');
insert into records values (7810,2,'2023-09-13','blood pressure');
insert into records values (8712,1,'2023-01-27','cough problem');
insert into records values (5413,1,'2023-03-22','dental problem');
insert into records values (1113,1,'2023-02-11','stomach ache');
insert into records values (1113,2,'2023-09-26','spinal problem');
insert into records values (2224,1,'2023-04-15','ligament injury');
insert into records values (2224,2,'2023-11-30','dental problem');
insert into records values (1295,1,'2023-05-19','stomach ache');
insert into records values (2718,1,'2022-05-14','blood pressure');
insert into records values (2718,2,'2023-12-04','blood pressure');
insert into records values (3123,1,'2023-08-07','heart problem');
insert into records values (4578,1,'2023-08-26','skin problem');
insert into records values (7535,1,'2021-11-22','blood pressure');
insert into records values (7535,2,'2023-06-17','dental problem');
insert into records values (9998,1,'2022-04-19','liver problem');
insert into records values (9998,2,'2022-09-23','cough problem');
insert into records values (9998,3,'2023-01-18','ligament injury');

