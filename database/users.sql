CREATE schema IF NOT EXISTS db_demo;

CREATE TABLE db_demo.users
(
    id         INTEGER UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name       varchar(255) NOT NULL,
    birth_year DATE         NOT NULL,
    email      varchar(255)
) ENGINE = InnoDB;

SELECT count(1) FROM users;
SHOW INDEXES FROM users;
SHOW GLOBAL VARIABLES LIKE 'innodb_flush_log_at_trx_%';
SHOW GLOBAL VARIABLES LIKE 'innodb_adaptive_%';

CREATE index birth_year_index USING BTREE ON db_demo.users (birth_year);
CREATE index birth_year_index USING HASH ON db_demo.users (birth_year);
DROP INDEX birth_year_index ON db_demo.users;

SET GLOBAL innodb_adaptive_hash_index = OFF;
SET GLOBAL innodb_adaptive_hash_index = ON;
SET GLOBAL innodb_flush_log_at_trx_commit = 1;

EXPLAIN SELECT * FROM users WHERE birth_year='2011-08-12';
EXPLAIN SELECT * FROM users WHERE birth_year>='2010-01-01' AND birth_year<='2012-01-01';
