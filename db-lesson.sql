-- Q1
CREATE TABLE departments (
 department_id INT  AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(20) NOT NULL,
 created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 );
 
--  Q2
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED 
AFTER email;

-- Q3
INSERT INTO departments (name)
VALUE
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name,email,department_id,age,gender)
VALUE
('あいうえ男','aaa@gizumo.jp', 1, 20, 1),
('かきくけ子','kkk@gizumo.jp', 1, 21, 2),
('さしすせそうじ','sss,@gizumo.jp', 1, 22 , 1),
('たちつてとと','ttt@gizumo.jp', 2, 23, 2),
('なにぬねのの','nnn@gizumo.jp', 2, 24, 2),
('はひふへほ','hhh@gizumo.jp', 2, 25, 2),
('まみむめもも','mmm@gizumo.jp', 2, 26, 2),
('やいゆえようじ','yyy@gizumo.jp', 3, 27, 1),
('らりるれろろ','rrr@gizumo.jp', 4, 28, 2),
('わいうえ男','www@gizumo.jp', 5, 29, 1);

INSERT INTO reports (person_id, content)
VALUE
(7, 'ああああああああ'),
(8, 'いいいいいいいい'),
(9, 'ううううううううう'),
(9, 'えええええええええ'),
(10, 'おおおおおおおおお'),
(11,'かかかかかかかか'),
(12, 'ききききききき'),
(13, 'くくくくくくくく'),
(13, 'けけけけけけけけ'),
(5, 'こここここここここ');

-- Q4
UPDATE people 
SET department_id =
CASE  person_id
  WHEN 1 THEN 4
  WHEN 2 THEN 2
  WHEN 3 THEN 3
  WHEN 4 THEN 2
  WHEN 6 THEN 5
END
WHERE department_id IS NULL;

-- Q5
SELECT name,age
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6
peopleテーブルで営業部の人の名前、メールアドレス、年齢を日報の作成日時が新しいものから順に並べるクエリ。

-- Q7
SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);

-- Q8
SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC ;
-- カラム全て？

-- Q9
SELECT ROUND(AVG(age)) AS average_age
FROM people
WHERE department_id = 2 AND gender =2;

-- Q11
SELECT people.name, reports.content
FROM people
LEFT JOIN reports 
ON people.person_id = reports.person_id
WHERE people.person_id 
NOT IN (
  SELECT DISTINCT reports.person_id
  FROM reports
);
