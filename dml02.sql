-- UPDATE
UPDATE users
SET name = '라이츄';

SELECT * FROM users;

SET SQL_SAFE_UPDATES = 1;
UPDATE users
SET name = '라이츄';

UPDATE users
SET name = '피카츄'
WHERE id = 1;

SET SQL_SAFE_UPDATES = 0;
-- 트랜잭션
START TRANSACTION;

UPDATE users
SET status = 'suspended'
WHERE name LIKE '%피카츄%';

SELECT * FROM users;

ROLLBACK;

SELECT * FROM users;

START TRANSACTION;

UPDATE users
SET status = 'inactive'
WHERE name LIKE '%라이츄%';

SELECT * FROM users;

COMMIT;

SELECT * FROM users;

--
SET SQL_SAFE_UPDATES = 1; -- id(PK)

-- SQL Error [1175]
UPDATE users
SET status = 'ban'
WHERE name LIKE '%라이츄%';

SET SQL_SAFE_UPDATES = 0;

-- SQL Error [1093]
UPDATE users
SET status = 'ban'
WHERE id IN (
    SELECT id
    FROM users
    WHERE name LIKE '%라이츄%'
);

UPDATE users
SET status = 'ban'
WHERE id IN (
    SELECT temp.id FROM (
                            SELECT id
                            FROM users
                            WHERE name LIKE '%라이츄%'
                        ) AS temp
);

SELECT * FROM users;