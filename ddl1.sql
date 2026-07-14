-- 데이터베이스 객체
-- CREATE (IF EXISTS)
CREATE TABLE IF NOT EXISTS types_test (
                                          id INT AUTO_INCREMENT PRIMARY KEY, -- PK.
    -- INT - int. -21 +21 -> +42 signed
    -- id2 INT UNSIGNED -- 42억을 0부터 +에만 몰아쓰겠다 (4바이트)
                                          big_counter BIGINT DEFAULT 0, -- 8바이트)
                                          exact_decimal DECIMAL(10, 2), -- 정수 최대 8자리, 소수 최대 2자리.
    yn TINYINT, -- 1바이트 2^8 -128 ~ 127. 0/1 (유사불리언) 1.2.3.4.5-> enum
    country_code CHAR(3), -- 3글자 미만이더라도 3글자의 메모리를 계속 유지
    user_email VARCHAR(100), -- 100자까지 받을 수 있음. VARCHAR(255) VARCHAR(2000)
    large_content TEXT,
    birth_date DATE,
    payment_datetime DATETIME,
    record_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

INSERT INTO types_test(
    big_counter, exact_decimal, country_code,
    user_email, large_content, birth_date,
    payment_datetime
) VALUES (
             -- BIGINT = long
             2300000000,	1234578.91, 'KOR',
             'my@email.com', '엄청 긴거...',
             '1999-09-09',
             '1999-09-09 09:09:09'
         );

SELECT * FROM types_test;

INSERT INTO types_test(
    big_counter, exact_decimal, country_code,
    user_email, large_content, birth_date,
    payment_datetime
) VALUES (
             -- BIGINT = long
             2300000000,
             1234578.91,
             -- 1234578910.91234, -- 범위에러가 남
             'KOR',
             -- 'KOREA',
             'my@email.com', '엄청 긴거...',
             '1999-09-09 09:09:09', -- DATETIME류를 DATE 넣으면 짤려서 들어감
             '1999-09-09 09:09:09'
         );