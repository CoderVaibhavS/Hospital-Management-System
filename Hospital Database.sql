-- create hospital database
-- DROP DATABASE HOSPITAL;
CREATE DATABASE hospital;
USE hospital;

-- tables definitions 
CREATE TABLE patient (
patient_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
sex CHAR(6) NOT NULL,
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000));

CREATE TABLE doctor (
doctor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
sex CHAR(6) NOT NULL,
specialisation varchar(15) NOT NULL,
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000));

CREATE TABLE staff (
staff_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
age INT NOT NULL,
sex CHAR(6) NOT NULL,
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000),
salary BIGINT NOT NULL);

CREATE TABLE room (
room_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
status CHAR(6) NOT NULL,
patient_id INT,
staff_id INT,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (staff_id) REFERENCES staff(staff_id));

CREATE TABLE records (
patient_id INT NOT NULL,
record_no INT NOT NULL,
date_of_examination DATE NOT NULL,
problem VARCHAR(255) NOT NULL,
PRIMARY KEY (patient_id, record_no),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id));

CREATE TABLE appointment (
patient_id INT NOT NULL,
doctor_id INT NOT NULL,
appointment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
apt_date DATE NOT NULL,
apt_time TIME NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE diagnosis (
diagnosis_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
patient_id INT NOT NULL,
doctor_id INT NOT NULL,
result VARCHAR(255) NOT NULL,
FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id));

CREATE TABLE bill (
receipt_no INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
appointment_id INT NOT NULL,
amount FLOAT NOT NULL,
FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id));

CREATE TABLE pays (
receipt_no INT NOT NULL PRIMARY KEY,
patient_id INT NOT NULL,
FOREIGN KEY (receipt_no) REFERENCES bill(receipt_no),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id));

-- insert values in patient table
insert into patient (name, age, sex, phone) VALUES ( 'Sanjeev' , 20 , 'male' ,8757740706);
insert into patient (name, age, sex, phone) values ( 'Vaibhav' , 29 , 'male' ,9767778987);
insert into patient (name, age, sex, phone) values ( 'Urvashi' , 34 , 'female' ,9757740777);
insert into patient (name, age, sex, phone) values ( 'Anirudh' , 43, 'male' ,6957740756);
insert into patient (name, age, sex, phone) values ( 'Adya' , 54 , 'female' ,6787740799);
insert into patient (name, age, sex, phone) values ( 'Jay' , 71 , 'male' ,8750007026);
insert into patient (name, age, sex, phone) values ( 'Adrija' , 47 , 'female' ,8657440760);
insert into patient (name, age, sex, phone) values ( 'Aliya' , 12 , 'female' ,7797740768);
insert into patient (name, age, sex, phone) values ( 'Harsh' , 67 , 'male' ,7757748806);
insert into patient (name, age, sex, phone) values ( 'Akash' , 45 , 'male' ,9877740706);
insert into patient (name, age, sex, phone) values ( 'Purvi' , 13 , 'female' ,8757706876);
insert into patient (name, age, sex, phone) values ( 'Deepak' , 19 , 'male' ,8757890769);
insert into patient (name, age, sex, phone) values ( 'Shreya' , 78 , 'female' ,7740707656);
insert into patient (name, age, sex, phone) values ( 'Kavin' , 64 , 'male' ,7896547078);
insert into patient (name, age, sex, phone) values ( 'Atharv' , 35 , 'male' ,7434242306);
insert into patient (name, age, sex, phone) values ( 'Priyanka' , 39 , 'female' ,8757894098);
insert into patient (name, age, sex, phone) values ( 'Tanisha' , 41 , 'female' ,7466707706);
insert into patient (name, age, sex, phone) values ( 'Anshika' , 53 , 'female' ,9878778706);
insert into patient (name, age, sex, phone) values ( 'Aditya' , 25 , 'male' ,9875740768);
insert into patient (name, age, sex, phone) values ( 'Aryan' , 17 , 'others' ,8897740709);
insert into patient (name, age, sex, phone) values ( 'Ojas' , 58 , 'male' ,7898706766);
insert into patient (name, age, sex, phone) values ( 'Kriti' , 46 , 'female' ,9994070665);
insert into patient (name, age, sex, phone) values ( 'Sourav' , 22 , 'male' ,8997740886);
insert into patient (name, age, sex, phone) values ( 'Lavanya' , 26 , 'female' ,7574006877);
insert into patient (name, age, sex, phone) values ( 'Mrinal' , 47 , 'others' ,9999070676);
insert into patient (name, age, sex, phone) values ( 'Deepika' , 92 , 'female' ,9898675676);
insert into patient (name, age, sex, phone) values ( 'Pratyush' , 83 , 'male' ,6787656786);
insert into patient (name, age, sex, phone) values ( 'Anushka' , 36 , 'female' ,6350602942);
insert into patient (name, age, sex, phone) values ( 'Apul' , 55 , 'male' ,8987663170);
insert into patient (name, age, sex, phone) values ( 'Sheetal' , 42 , 'female' ,8987880656);

-- insert values in doctor table
insert into doctor (name, age, sex, specialisation, phone) values ('Vikas',40,'male', 'heart' ,8293445689);
insert into doctor (name, age, sex, specialisation, phone) values ('Suman',39,'female', 'skin' ,6355667987);
insert into doctor (name, age, sex, specialisation, phone) values ('Apurv',28,'male', 'brain' ,9987878735);
insert into doctor (name, age, sex, specialisation, phone) values ('Bhavna',32,'female', 'neuro' ,8987445690);
insert into doctor (name, age, sex, specialisation, phone) values ('Tanmay',46,'male', 'stomach' ,7760895585);
insert into doctor (name, age, sex, specialisation, phone) values ('Virat',40,'male', 'dental' ,9834567894);
insert into doctor (name, age, sex, specialisation, phone) values ('Sonam',36,'female', 'heart' ,8943785689);
insert into doctor (name, age, sex, specialisation, phone) values ('Mamta',35,'female', 'eyes' ,7768189585);


-- insert values in staff table
insert into staff (name, age, sex, phone, salary) values ('Tony',24,'male',7787646568,340000);
insert into staff (name, age, sex, phone, salary) values ('Ravi',24,'male',8997646568,540000);
insert into staff (name, age, sex, phone, salary) values ('Mohan',24,'male',7797646999,230000);
insert into staff (name, age, sex, phone, salary) values ('Varun',24,'male',9987646568,120000);
insert into staff (name, age, sex, phone, salary) values ('Ritik',24,'male',7887666688,330000);
insert into staff (name, age, sex, phone, salary) values ('Sakshi',24,'female',8987646689,620000);
insert into staff (name, age, sex, phone, salary) values ('Umang',24,'male',6587646566,390000);
insert into staff (name, age, sex, phone, salary) values ('Rohan',24,'male',9887646577,370000);
insert into staff (name, age, sex, phone, salary) values ('Navya',24,'female',7667647996,510000);
insert into staff (name, age, sex, phone, salary) values ('Bharti',24,'female',6998607087,210000);
insert into staff (name, age, sex, phone, salary) values ('Manas',24,'male',7978776579,840000);
insert into staff (name, age, sex, phone, salary) values ('Akshat',24,'male',9898999642,440000);

-- insert values in room table
insert into room (status, patient_id, staff_id) values ('booked',14, 6);
insert into room (status, patient_id, staff_id) values ('booked',21, 9);
insert into room (status, patient_id, staff_id) values ('free',null, null);
insert into room (status, patient_id, staff_id) values ('booked',15, 12);
insert into room (status, patient_id, staff_id) values ('free',null, null);
insert into room (status, patient_id, staff_id) values ('free',null, null);
insert into room (status, patient_id, staff_id) values ('free',null, null);
insert into room (status, patient_id, staff_id) values ('booked',12, 4);
insert into room (status, patient_id, staff_id) values ('free',null, null);
insert into room (status, patient_id, staff_id) values ('free',null, null);

-- insert values in records
insert into records values (12,1,'2022-04-013','cough problem');
insert into records values (12,2,'2023-07-23','blood pressure');
insert into records values (13,1,'2021-08-14','heart problem');
insert into records values (14,1,'2022-02-05','lung problem');
insert into records values (15,1,'2020-10-28','skin problem');
insert into records values (15,2,'2022-04-19','liver problem');
insert into records values (15,3,'2023-03-12','blood pressure');
insert into records values (16,1,'2022-04-30','skin problem');
insert into records values (17,1,'2022-04-12','blood pressure');
insert into records values (18,1,'2022-05-07','stomach ache');
insert into records values (18,2,'2023-09-06','cough problem');
insert into records values (21,1,'2023-01-09','stomach ach');
insert into records values (19,1,'2023-01-13','blood pressure');
insert into records values (27,1,'2022-11-23','liver problem');
insert into records values (21,2,'2022-12-26','cough problem');
insert into records values (21,3,'2023-02-24','heart problem');
insert into records values (12,3,'2021-05-06','eye problem');
insert into records values (11,1,'2020-06-30','dental problem');
insert into records values (11,2,'2021-07-21','skin problem');
insert into records values (11,3,'2023-03-05','liver problem');
insert into records values (30,1,'2023-04-04','heart problem');
insert into records values (31,1,'2023-09-03','stomach ache');
insert into records values (2,1,'2022-10-10','cough problem');
insert into records values (2,2,'2023-08-15','skin problem');
insert into records values (3,1,'2023-04-14','lung problem');
insert into records values (11,4,'2023-02-11','stomach ache');
insert into records values (11,5,'2023-09-26','spinal problem');
insert into records values (22,1,'2023-04-15','ligament injury');
insert into records values (22,2,'2023-11-30','dental problem');
insert into records values (19,2,'2023-05-19','stomach ache');
insert into records values (27,2,'2022-05-14','blood pressure');
insert into records values (27,3,'2023-12-04','blood pressure');
insert into records values (31,2,'2023-08-07','heart problem');
