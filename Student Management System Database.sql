Student Management System Database Project

-- 1. Create Database
CREATE DATABASE StudentManagement;
USE StudentManagement;

-- 2. Create Tables
CREATE TABLE Students (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(15),
    Department VARCHAR(30)
);

CREATE TABLE Courses (
    Course_ID INT PRIMARY KEY AUTO_INCREMENT,
    Course_Name VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    Enrollment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Student_ID INT,
    Course_ID INT,
    Semester VARCHAR(10),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID)
);

CREATE TABLE Results (
    Result_ID INT PRIMARY KEY AUTO_INCREMENT,
    Enrollment_ID INT,
    Marks INT,
    Grade CHAR(2),
    FOREIGN KEY (Enrollment_ID) REFERENCES Enrollments(Enrollment_ID)
);

-- 3. Insert Sample Data
INSERT INTO Students (Name, Email, Phone, Department)
VALUES 
('Rohit Sharma', 'rohit@gmail.com', '9876543210', 'CSE'),
('Ananya Rao', 'ananya@gmail.com', '9998887776', 'ECE');

INSERT INTO Courses (Course_Name, Credits)
VALUES 
('Java Programming', 4),
('Database Systems', 3);

INSERT INTO Enrollments (Student_ID, Course_ID, Semester)
VALUES 
(1, 1, 'S1'),
(1, 2, 'S1'),
(2, 2, 'S2');

INSERT INTO Results (Enrollment_ID, Marks, Grade)
VALUES 
(1, 85, 'A'),
(2, 78, 'B'),
(3, 92, 'A');

-- 4. CRUD Queries
-- Add new student
INSERT INTO Students (Name, Email, Phone, Department)
VALUES ('Manish Kumar', 'manish@gmail.com', '9090909090', 'IT');

-- Update student phone
UPDATE Students SET Phone='8888888888' WHERE Student_ID=1;

-- Delete student
DELETE FROM Students WHERE Student_ID=2;

-- View all students
SELECT * FROM Students;

-- 5. Joins (Student + Course + Marks)
SELECT 
    s.Name, 
    c.Course_Name, 
    r.Marks, 
    r.Grade
FROM Students s
JOIN Enrollments e ON s.Student_ID = e.Student_ID
JOIN Courses c ON c.Course_ID = e.Course_ID
JOIN Results r ON r.Enrollment_ID = e.Enrollment_ID;
