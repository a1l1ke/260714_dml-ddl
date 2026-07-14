-- 1. 부서 테이블 생성 (부모 테이블)
CREATE TABLE departments_test (
                                  dept_id INT PRIMARY KEY,                           -- PRIMARY KEY: 테이블의 고유 식별자 (중복 불가, NULL 불가)
                                  dept_name VARCHAR(50) NOT NULL UNIQUE              -- NOT NULL & UNIQUE: 필수 입력값이고 컬럼 내 유일값 보장
);

-- 2. 사원 테이블 생성 (자식 테이블 - 외래키 관계)
CREATE TABLE employees_test (
                                emp_id INT AUTO_INCREMENT PRIMARY KEY,             -- PRIMARY KEY: 자동 증가 일련번호 지정
                                emp_email VARCHAR(100) NOT NULL UNIQUE,            -- NOT NULL & UNIQUE: 이메일 고유성 확보
                                status VARCHAR(20) DEFAULT 'ACTIVE',               -- DEFAULT: 값이 주어지지 않았을 때 대입되는 초기값
                                dept_id INT,

    -- FOREIGN KEY: 부모 테이블인 departments_test의 PK인 dept_id를 참조하여 참조 무결성 보장
    -- 부모 데이터 삭제 시 자식 데이터의 부서 키를 NULL로 처리하도록 ON DELETE SET NULL 적용
                                FOREIGN KEY (dept_id) REFERENCES departments_test(dept_id)
                                    ON DELETE SET NULL
                                    ON UPDATE CASCADE
);

-- 초기 기초 데이터 적재
INSERT INTO departments_test (dept_id, dept_name) VALUES
                                                      (10, '인사팀'),
                                                      (20, '개발팀');

INSERT INTO employees_test (emp_email, dept_id) VALUES
                                                    ('alice@example.com', 10),
                                                    ('bob@example.com', 20);

-- PK
INSERT INTO departments_test (dept_id, dept_name) VALUES
    (10, '회계'); -- PK.
INSERT INTO employees_test (emp_email, dept_id) VALUES
    ('alice@example.com', 10); -- Unique
INSERT INTO departments_test (dept_id, dept_name) VALUES
    (10, NULL);
-- FK
INSERT INTO employees_test (emp_email, dept_id) VALUES
    ('lice@example.com', 99);