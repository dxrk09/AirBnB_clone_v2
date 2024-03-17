-- a script that prepares a MySQL server
-- database hbnb_test_db
-- new user hbnb_test
-- password of hbnb_test is hbnb_test_pwd

-- Creates hbnb_test_db database
CREATE DATABASE IF NOT EXISTS hbnb_test_db;

-- Creates a new user
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- Grants privileges to new user
GRANT ALL PRIVILEGES ON hbnb_test_db.* TO 'hbnb_test'@'localhost';

-- Grants SELECT privilege to new user
GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';

-- Flush privileges to apply changes
FLUSH PRIVILEGES;
