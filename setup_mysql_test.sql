-- a script that prepares a MySQL server
-- database hbnb_test_db
-- new user hbnb_test
-- password of hbnb_test is hbnb_test_pwd

-- Creates hbnb_test_db database
CREATE DATABASE IF NOT EXISTS hbnb_test_db;

-- Creates a new user
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

--GRANTS all privileges to new user
GRANT ALL PRIVILEGES TO 'hbnb_test'@'localhost' ON hbnb_test_pwd.*

-- GRANTS SELECT privilege to new user
GRANT SELECT TO 'hbnb_test'@'localhost' ON performance_schema.*

-- Flush privileges to apply changes
FLUSH PRIVILEGES
