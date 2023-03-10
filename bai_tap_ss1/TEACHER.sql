SELECT *
FROM bai_tap_ss1.teacher;
CREATE TABLE teacher
(
    id      INT PRIMARY KEY,
    name    VARCHAR(45),
    age     INT,
    country VARCHAR(45)
);
INSERT INTO teacher
    VALUE(1,'LANH',33,'VN'),(2,'LANH1',33,'VN'),(3,'LANH2',33,'VN'),(4,'LANH3',33,'VN');
UPDATE teacher
SET name = 'LANH5'
WHERE id = 4;
DROP TABLE teacher;