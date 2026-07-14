-- 하드 딜리트
START TRANSACTION;
DELETE FROM users
WHERE id = 3;
SELECT * FROM users;
COMMIT;

-- 소프트 딜리트
UPDATE users
SET is_deleted = 0;
SELECT * FROM users;
UPDATE users
SET is_deleted = 1
WHERE id = 1;
SELECT *
FROM users
WHERE is_deleted = 0;
-- 1. 인조키 2. 소프트 딜리트
SELECT *
FROM users
WHERE is_deleted = 1;