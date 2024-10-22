CREATE TABLE course (
id INT PRIMARY KEY,
	name VARCHAR(25),
	teacher_id INT);
	
	INSERT INTO course(id, name, teacher_id) VALUES
	(1, 'Database design', 1),
	(2, 'English literature', 2),
	(3, 'Python programming', 1);
	
CREATE TABLE student (
	id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50));
	
	INSERT INTO student (id, first_name, last_name) VALUES
	(1,'Shreya', 'Bain'),
	(2, 'Rianna', 'Foster'),
	(3, 'yosef', 'Naylor');
	
CREATE TABLE student_course (
	student_id INT,
	course_id INT,
	PRIMARY KEY (student_id, course_id),
	FOREIGN KEY (student_id) REFERENCES student(id),
	FOREIGN KEY (course_id) REFERENCES course(id)
	);
	
	INSERT INTO student_course (student_id, course_id) VALUES
	(1, 2),
	(1, 3),
	(2, 1),
	(2, 2),
	(2, 3),
	(3, 1);
	
CREATE TABLE teacher (
	id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50));
	
	INSERT INTO teacher (id, first_name, last_name) VALUES
	(1, 'Taylah', 'Booker'),
	(2, 'Sarah-Louise', 'Blake');

SELECT
S.ID as student_id,
s.first_name,
s.last_name,
sc.course_id
FROM
student s
JOIN
student_course sc ON s.id = sc.student_id;

SELECT
c.id AS course_id,
c.name AS course_name,
t.id AS teacher_id,
t.first_name AS teacher_first_name,
t.last_name AS teacher_last_name
FROM
course c
JOIN
teacher t ON c.teacher_id = t.id;

SELECT
sc.student_id,
c.id AS course_id,
c.name AS course_name
FROM
student_course sc
JOIN
course c ON sc.course_id = c.id;

