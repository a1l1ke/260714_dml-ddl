-- 1. 회원 테이블 (users)
CREATE TABLE IF NOT EXISTS users (
                                     id INT AUTO_INCREMENT PRIMARY KEY,
                                     name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    status VARCHAR(20) DEFAULT 'active',
    is_deleted TINYINT(1) DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME DEFAULT NULL
    );

-- 2. 기록 보관용 회원 테이블 (archive_users)
CREATE TABLE IF NOT EXISTS archive_users (
                                             id INT PRIMARY KEY,
                                             name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    archived_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );

DESC users;

-- INSERT INTO table (...)
-- INSERT INTO users (id, name, email, status, is_deleted, created_at, last_login)
-- VALUES (...)
INSERT INTO users
(name, email)
VALUES
    ('피카츄', 'pika@poke.mon');

SELECT * FROM users;

INSERT INTO users
(name, email)
VALUES
    ('피카츄1', 'pika1@poke.mon'),
    ('피카츄2', 'pika2@poke.mon'),
    ('피카츄3', 'pika3@poke.mon'),
    ('피카츄4', 'pika4@poke.mon');

SELECT * FROM users;

INSERT INTO archive_users
(id, name, email)
SELECT
    id, name, email -- 열의 개수와 제약조건만 일치
FROM
    users
WHERE
    name LIKE '%3%';

SELECT * FROM archive_users;









