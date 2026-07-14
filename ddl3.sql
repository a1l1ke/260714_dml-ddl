-- CREATE
CREATE TABLE IF NOT EXISTS schema_test (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    status CHAR(1) DEFAULT 'Y'
    );

DESC schema_test;

-- ALTER (alternate)
ALTER TABLE schema_test
    ADD content TEXT NULL;

-- DESCRIBE
DESC schema_test;

ALTER TABLE schema_test
    ADD writer TEXT NULL
	AFTER title;

DESC schema_test;

ALTER TABLE schema_test
    MODIFY status VARCHAR(20) DEFAULT 'PENDING';
-- 타입이 기존 데이터와 호환 X 오류가 생김

DESC schema_test;

ALTER TABLE schema_test
DROP COLUMN content;

DESC schema_test;

DROP TABLE schema_test;

SHOW TABLES;