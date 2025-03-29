USE wct_ass3;
INSERT INTO student (student_id, first_name, last_name, date_of_birth, email) 
VALUES ('1','Alice', 'Johnson', '2001-06-15', 'alice@example.com');

SELECT s.student_id, s.first_name, s.last_name, s.email
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE c.course_code = 'CS101';

SELECT f.faculty_id, f.name, f.email, f.title
FROM faculty f
JOIN department d ON f.department_id = d.department_id
WHERE d.department_name = 'Computer Science';



SELECT c.course_code, c.course_name, c.credits
FROM course c
JOIN enrollment e ON c.course_id = e.course_id
JOIN student s ON e.student_id = s.student_id
WHERE s.first_name = 'Alice' AND s.last_name = 'Johnson';



SELECT s.student_id, s.first_name, s.last_name, s.email
FROM student s
LEFT JOIN enrollment e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;



SELECT c.course_code, c.course_name, AVG(
    CASE 
        WHEN grade = 'A' THEN 4.0
        WHEN grade = 'B' THEN 3.0
        WHEN grade = 'C' THEN 2.0
        WHEN grade = 'D' THEN 1.0
        WHEN grade = 'F' THEN 0.0
        ELSE NULL
    END) AS average_gpa
FROM enrollment e
JOIN course c ON e.course_id = c.course_id
WHERE c.course_code = 'CS101'
GROUP BY c.course_id;
