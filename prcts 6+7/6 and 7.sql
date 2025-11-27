CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY, -- Уникальный идентификатор студента
    full_name VARCHAR(255) NOT NULL, -- Полное имя студента
    email VARCHAR(255) UNIQUE NOT NULL, -- Электронная почта студента (должна быть уникальной)
    start_year INT -- Год поступления студента
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY, -- Уникальный идентификатор курса
    course_name VARCHAR(255) NOT NULL, -- Название курса
    credits INT CHECK (credits > 0) -- Количество зачетных единиц курса (должно быть больше 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE, -- Ссылка на ID студента (внешний ключ)
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE, -- Ссылка на ID курса (внешний ключ)
    grade CHAR(1), -- Оценка студента за курс (например, 'A', 'B', 'C')
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO Students VALUES (DEFAULT, 'Алексей Смирнов', 'alex_Smirnov@mail.com', 2021);
INSERT INTO Students VALUES (DEFAULT, 'Елена Кузнецова', 'elena_Cuznec@mail.com', 2022);
INSERT INTO Students VALUES (DEFAULT, 'Дмитрий Новиков', 'dima_novikov@mail.com', 2021);
INSERT INTO Students VALUES (DEFAULT, 'Ольга Морозова', 'olya_moroz@mail.com', 2023);
INSERT INTO Courses VALUES (DEFAULT, 'Введение в программирование', 5);
INSERT INTO Courses VALUES (DEFAULT, 'Базы данных', 4);
INSERT INTO Courses VALUES (DEFAULT, 'Веб-технологии', 4);
INSERT INTO enrollments VALUES (1,2,'A');
INSERT INTO enrollments VALUES (2,2,'B');
INSERT INTO enrollments VALUES (2,3,'A');
INSERT INTO enrollments VALUES (4,1);
INSERT INTO enrollments VALUES (4,2);
INSERT INTO enrollments VALUES (4,3);
UPDATE students
set email = 'elena.kuznetsova@newmail.com'
WHERE full_name = 'Елена Кузнецова'

UPDATE enrollments
set grade = 'A'
WHERE student_id = 4 and course_id = 1

DELETE FROM students
WHERE student_id = 5

SELECT * FROM students

SELECT course_name, credits FROM courses

SELECT * FROM students where start_year = 2021

SELECT courses FROM courses WHERE credits > 4

SELECT full_name FROM students WHERE email = 'elena.kuznetsova@newmail.com'

SELECT * FROM students WHERE full_name LIKE 'Дмитрий%'

SELECT * FROM enrollments WHERE grade ISNULL

SELECT * FROM courses ORDER BY course_name

SELECT * FROM students ORDER BY start_year

SELECT * FROM students ORDER BY full_name  DESC LIMIT 2