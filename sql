CREATE DATABASE salle_management;
USE salle_management;

CREATE TABLE members(
member_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender ENUM('male','female','other'),
date_of_birth DATE,
phone_number VARCHAR(50),
email VARCHAR(100)
);
CREATE TABLE rooms(
room_id int AUTO_INCREMENT UNIQUE KEY,
room_number varchar(10),
room_type ENUM('cardio','weights','studio'),
capacity int

);

CREATE TABLE memberships(
membership_id int  AUTO_INCREMENT UNIQUE KEY,
member_id int,
room_id int,
start_date date,
FOREIGN KEY (member_id) REFERENCES members(member_id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE departments (
department_id int  AUTO_INCREMENT UNIQUE KEY,
department_name VARCHAR(50),
location VARCHAR(100)
);

CREATE TABLE trainers (
trainer_id int AUTO_INCREMENT UNIQUE KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
specialization VARCHAR(50),
department_id int,
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE appointments(
appointment_id int AUTO_INCREMENT UNIQUE KEY,
appointment_date date,
appointment_time time,
trainer_id int,
member_id int,
FOREIGN KEY (trainer_id)REFERENCES trainers(trainer_id),
FOREIGN KEY (member_id) REFERENCES members(member_id)
);
CREATE TABLE workout_plans(
plan_id int AUTO_INCREMENT UNIQUE KEY,
member_id int,
trainer_id int, 
instructions VARCHAR(255),
FOREIGN KEY (trainer_id)REFERENCES trainers(trainer_id),
FOREIGN KEY (member_id) REFERENCES members(member_id)
);
INSERT INTO members (first_name, last_name, gender, date_of_birth, phone_number, email)
VALUES ('Alex', 'Johnson', 'male', '1990-07-15', '1234567890', 'alex.johnson@example.com');
select * from  members;
INSERT INTO members (first_name, last_name, gender, date_of_birth, phone_number, email)
VALUES
('Emily', 'Brown', 'female', '1995-03-22', '1239874560', 'emily.brown@example.com'),
('Michael', 'Smith', 'male', '1988-11-12', '1122334455', 'michael.smith@example.com'),
('Sarah', 'Taylor', 'female', '1999-06-30', '1223344556', 'sarah.taylor@example.com'),
('James', 'Williams', 'male', '2002-01-05', '9876543210', 'james.williams@example.com'),
('Sophia', 'Wilson', 'female', '1997-09-17', '7788994455', 'sophia.wilson@example.com'),
('Benjamin', 'Davis', 'male', '1993-05-10', '8899001122', 'benjamin.davis@example.com'),
('Olivia', 'Martinez', 'female', '1990-02-14', '6677889900', 'olivia.martinez@example.com'),
('Ethan', 'Garcia', 'male', '1985-12-25', '2233445566', 'ethan.garcia@example.com'),
('Emma', 'Clark', 'female', '1998-04-18', '3344556677', 'emma.clark@example.com'),
('William', 'Rodriguez', 'male', '1996-07-22', '1123445566', 'william.rodriguez@example.com'),
('Isabella', 'Lewis', 'female', '2003-10-10', '6677884455', 'isabella.lewis@example.com'),
('Jacob', 'Lee', 'male', '2001-03-19', '9988776655', 'jacob.lee@example.com'),
('Mia', 'Walker', 'female', '1994-11-30', '7766554433', 'mia.walker@example.com'),
('Daniel', 'Hall', 'male', '1989-08-08', '5544332211', 'daniel.hall@example.com');
INSERT INTO rooms (room_number, room_type, capacity)
VALUES
('R101', 'cardio', 20),
('R102', 'weights', 15),
('R103', 'studio', 25),
('R104', 'cardio', 18),
('R105', 'weights', 20),
('R106', 'studio', 30),
('R107', 'cardio', 22),
('R108', 'weights', 12),
('R109', 'studio', 28),
('R110', 'cardio', 19),
('R111', 'weights', 16),
('R112', 'studio', 26),
('R113', 'cardio', 21),
('R114', 'weights', 14),
('R115', 'studio', 29);

INSERT INTO departments (department_name, location)
VALUES
('Cardio', 'First Floor'),
('Weights', 'Second Floor'),
('Yoga', 'Third Floor'),
('Pilates', 'Fourth Floor'),
('CrossFit', 'Basement'),
('Aerobics', 'First Floor'),
('Boxing', 'Ground Floor'),
('Dance', 'Third Floor'),
('Meditation', 'Fifth Floor'),
('HIIT', 'Second Floor'),
('Stretching', 'Third Floor'),
('Kickboxing', 'Ground Floor'),
('Zumba', 'First Floor'),
('Cycling', 'Basement'),
('TRX', 'Second Floor');
INSERT INTO trainers (first_name, last_name, specialization, department_id)
VALUES
('John', 'Doe', 'Cardio Specialist', 1),
('Jane', 'Smith', 'Weight Training Expert', 2),
('Alice', 'Brown', 'Yoga Instructor', 3),
('Mark', 'Taylor', 'Pilates Instructor', 4),
('Emma', 'Wilson', 'CrossFit Coach', 5),
('Liam', 'Martinez', 'Aerobics Trainer', 6),
('Sophia', 'Anderson', 'Boxing Coach', 7),
('Oliver', 'Garcia', 'Dance Instructor', 8),
('Ava', 'Rodriguez', 'Meditation Guide', 9),
('Ethan', 'Walker', 'HIIT Coach', 10),
('Lucas', 'Hall', 'Stretching Trainer', 11),
('Charlotte', 'Lee', 'Kickboxing Coach', 12),
('Mason', 'Clark', 'Zumba Instructor', 13),
('Amelia', 'King', 'Cycling Coach', 14),
('Elijah', 'Scott', 'TRX Specialist', 15);
INSERT INTO memberships (member_id, room_id, start_date)
VALUES
(1, 1, '2024-01-10'),
(2, 2, '2024-02-15'),
(3, 3, '2024-03-20'),
(4, 4, '2024-04-25'),
(5, 5, '2024-05-30'),
(6, 6, '2024-06-10'),
(7, 7, '2024-07-15'),
(8, 8, '2024-08-20'),
(9, 9, '2024-09-25'),
(10, 10, '2024-10-30'),
(11, 11, '2024-11-05'),
(12, 12, '2024-12-10'),
(13, 13, '2025-01-15'),
(14, 14, '2025-02-20'),
(15, 15, '2025-03-25');
INSERT INTO appointments (appointment_date, appointment_time, trainer_id, member_id)
VALUES
('2024-01-15', '10:00:00', 1, 1),
('2024-01-16', '11:00:00', 2, 2),
('2024-01-17', '12:00:00', 3, 3),
('2024-01-18', '13:00:00', 4, 4),
('2024-01-19', '14:00:00', 5, 5),
('2024-01-20', '15:00:00', 6, 6),
('2024-01-21', '16:00:00', 7, 7),
('2024-01-22', '17:00:00', 8, 8),
('2024-01-23', '18:00:00', 9, 9),
('2024-01-24', '19:00:00', 10, 10),
('2024-01-25', '10:30:00', 11, 11),
('2024-01-26', '11:30:00', 12, 12),
('2024-01-27', '12:30:00', 13, 13),
('2024-01-28', '13:30:00', 14, 14),
('2024-01-29', '14:30:00', 15, 15);
INSERT INTO workout_plans (member_id, trainer_id, instructions)
VALUES
(1, 1, '30 minutes of treadmill and 20 minutes of stretching'),
(2, 2, 'Weight lifting for arms and legs'),
(3, 3, 'Yoga poses for flexibility'),
(4, 4, 'Pilates session for core strength'),
(5, 5, 'CrossFit circuits with weights'),
(6, 6, 'Aerobics routine for 45 minutes'),
(7, 7, 'Boxing practice and sparring'),
(8, 8, 'Dance warm-ups and choreography'),
(9, 9, 'Meditation techniques for 30 minutes'),
(10, 10, 'HIIT session with intervals'),
(11, 11, 'Full-body stretching routine'),
(12, 12, 'Kickboxing training for strength'),
(13, 13, 'Zumba dance cardio'),
(14, 14, 'Cycling intervals for endurance'),
(15, 15, 'TRX suspension training');
select department_name,location 
  from departments;
select * from members ORDER BY date_of_birth ASC;
  select distinct gender
  from members;
SELECT *
FROM trainers
LIMIT 3;

SELECT *
FROM members
WHERE date_of_birth > '2000-01-01';
SELECT trainers.*
FROM trainers
JOIN departments ON trainers.department_id = departments.department_id
WHERE department_name IN ('Musculation', 'Cardio');
SELECT *
FROM memberships
WHERE start_date BETWEEN '2024-12-01' AND '2024-12-07';

SELECT first_name, last_name, 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Junior'
        WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 18 AND 60 THEN 'Adulte'
        ELSE 'Senior'
    END AS age_category
FROM members;

SELECT COUNT(*) AS total_appointments
FROM appointments;
SELECT d.department_name, COUNT(t.trainer_id) AS trainer_count
FROM trainers t
JOIN departments d ON t.department_id = d.department_id
GROUP BY d.department_name;
SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age
FROM members;

SELECT appointment_date, appointment_time
FROM appointments
ORDER BY appointment_date DESC, appointment_time DESC
LIMIT 1;
SELECT r.room_number, COUNT(m.membership_id) AS total_memberships
FROM memberships m
JOIN rooms r ON m.room_id = r.room_id
GROUP BY r.room_number;
SELECT *
FROM members
WHERE email IS NULL OR email = '';
SELECT a.appointment_date, a.appointment_time, 
       CONCAT(t.first_name, ' ', t.last_name) AS trainer_name, 
       CONCAT(m.first_name, ' ', m.last_name) AS member_name
FROM appointments a
JOIN trainers t ON a.trainer_id = t.trainer_id
JOIN members m ON a.member_id = m.member_id;


