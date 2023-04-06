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
phone BIGINT NOT NULL CHECK (phone >= 1000000000 AND phone < 10000000000),
salary BIGINT NOT NULL);

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
apt_date DATE NOT NULL,
apt_time TIME NOT NULL,
PRIMARY KEY (patient_id, doctor_id),
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
pmt_date DATE NOT NULL);

CREATE TABLE bill_particulars (
name VARCHAR(20) NOT NULL,
receipt_no INT NOT NULL,
price FLOAT NOT NULL,
PRIMARY KEY (receipt_no, name),
FOREIGN KEY (receipt_no) REFERENCES bill(receipt_no));

CREATE TABLE pays (
receipt_no INT NOT NULL PRIMARY KEY,
patient_id CHAR(5) NOT NULL,
FOREIGN KEY (receipt_no) REFERENCES bill(receipt_no),
FOREIGN KEY (patient_id) REFERENCES patient(patient_id));
