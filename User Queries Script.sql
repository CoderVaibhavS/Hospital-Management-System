-- query 1
INSERT INTO doctor VALUES (21980, 'Nitin', 47, 'Male', 'Cardiac', 9876543210, 4000000);

-- query 2
INSERT INTO records VALUES (12536, 2, '2023-04-06', 'fever');

-- query 3
INSERT INTO staff VALUES (12826, 'Priya', 29, 'Female', 9829104820, 1000000);

-- query 4
INSERT INTO appointment (patient_id, doctor_id, apt_date, apt_time)
(SELECT 12536, doctor.doctor_id, '2023-04-06', '16:00:00'
FROM doctor LEFT JOIN appointment 
ON doctor.doctor_id = appointment.doctor_id 
WHERE (specialisation = 'Cardiac' 
AND apt_date IS NULL AND apt_time IS NULL)
LIMIT 1);

-- query 5
UPDATE appointment SET apt_date = '2023-04-07', apt_time = '17:00:00'
WHERE patient_id = 12536 AND doctor_id = 21980;

-- query 6
UPDATE room SET status = 'booked', 
patient_id = 12536, 
staff_id = 12826 
WHERE status = 'free'
LIMIT 1;

-- query 7
UPDATE room SET
staff_id = 12826
WHERE room_no = 2;

-- query 8
INSERT INTO bill VALUES (1, '2023-04-06');
INSERT INTO bill_particulars VALUES ('diagnosis', 1, 1439.50);
INSERT INTO bill_particulars VALUES ('room', 1, 1500.00);
INSERT INTO bill_particulars VALUES ('consulting fees', 1, 540);
select * from room;