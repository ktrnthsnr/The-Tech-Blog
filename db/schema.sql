-- Log into mysql  $ `mysql -u root -p`
-- To run manually for testing, run under the mysql command line, 
--   mysql> source db/schema.sql
--   mysql> source db/seeds.sql

-- NOTE: Once you seed the tables with content, 
-- then reset the Sequelize sync located in the server.js to false, 
-- otherwise the tables will be recreated, rows emptied.

DROP DATABASE IF EXISTS the_tech_blog_db;

CREATE DATABASE the_tech_blog_db;

-- show databases;

use the_tech_blog_db;



-- to exit the msql2 command line, type quit

-- use the_tech_blog_db;