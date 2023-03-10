SELECT *
FROM bai_tap_ss1.class;
CREATE TABLE lop
(
    id   INT PRIMARY KEY,
    name VARCHAR(45)
);
INSERT INTO lop(id, name)
    value(1,'C10'),(2,'C11'),(3,'C12');
INSERT INTO lop(id, name)
    value(4,'C13'),(5,'C14');
UPDATE lop
SET name = 'C10'
WHERE id = 5;
DELETE
FROM lop
WHERE id = 4;
DROP TABLE lop;