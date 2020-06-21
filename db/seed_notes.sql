-- seed post with one to start
INSERT INTO post (title, post_url, user_id, created_at, updated_at)
VALUES ("The Tech Blog goes public!", "https://techblogsample/press", 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- connect
--  mysql -u root -p
--      select * from comment;select * from post;select * from user;select * from vote;


-- BACKUP:  CD /db, then backup of tables and data, run in bash
--  use just_tech_news_db;
--      mysqldump -u root -p  the_tech_blogs_db >  the_tech_blogs_db.sql

-- RESTORE: cd /db
-- will create the db and import the tables\data
--          mysql -u root -p the_tech_blogs_db< the_tech_blogs_db.sql
-- import syntax
-- mysqld  the_tech_blogs_db  < the_tech_blogs_db.sql

--------------------------------------------------------------------------------------------------------------
-- Steps:  1. backup, 2. then push to github and heroku 3. seed through mysql workbench, or slower, Insomnia
-- TO DO: add walkthrough on how to see via MySql Db with a seeds.sql script, 
-- showing how to connect with JawsDB credentials to the DB then pushing the INSERTS remotely