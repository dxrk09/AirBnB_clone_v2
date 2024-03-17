-- script that prepares a MySQL server
-- database hbnb_dev_db
-- new user hbnb_dev in localhost
-- password of hbnb_dev is hbnb_dev_pwd
-- GRANT hbnb_dev all privileges on the database hbnb_dev_db
-- GRANT hbnb_dev SELECT privilege on the database performance_schema

CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
CREATE USER IF NOT EXISTS hbnb_dev@localhost IDENTIFIED BY hbnb_dev_pwd;
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO hbnb_dev@localhost;
GRANT SELECT ON performance_schema.* TO hbnb_dev@localhost;
FLUSH PRIVILEGES;
