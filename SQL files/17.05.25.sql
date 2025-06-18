SHOW DATABASES;
CREATE DATABASE vit_bhopal;
USE vit_bhopal;

CREATE TABLE vit_bhopal_students (
    full_name VARCHAR(100),
    reg_no VARCHAR(20) PRIMARY KEY,
    school VARCHAR(100),
    graduation_year INT
);

INSERT INTO vit_bhopal_students (full_name, reg_no, school, graduation_year) VALUES
('Aarav Kapoor', '23CSE001', 'School of Computer Science', 2026),
('Diya Mehra', '23EEE002', 'School of Electrical Engineering', 2025),
('Ishaan Patel', '23MEC003', 'School of Mechanical Engineering', 2025),
('Tanya Sharma', '23CSE004', 'School of Computer Science', 2025),
('Rehan Malik', '23CSE005', 'School of Computer Science', 2026),
('Simran Gupta', '23ECE006', 'School of Electronics Engineering', 2025),
('Ananya Joshi', '23BUS007', 'School of Business', 2024),
('Kabir Deshmukh', '23CIV008', 'School of Civil Engineering', 2026),
('Meera Nair', '23BIO009', 'School of Bio Sciences', 2025);

ALTER TABLE vit_bhopal_students ADD phone VARCHAR(15);

ALTER TABLE vit_bhopal_students DROP COLUMN phone;

ALTER TABLE vit_bhopal_students ADD country VARCHAR(20) DEFAULT 'India';

UPDATE vit_bhopal_students SET full_name = 'Sid Verma' WHERE full_name = 'Meera Nair';
