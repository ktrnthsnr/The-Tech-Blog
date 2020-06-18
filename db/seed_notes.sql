-- lesson 13.3.6
INSERT INTO post (title, post_url, user_id, created_at, updated_at)
VALUES ("The Tech Blog goes public!", "https://techblogsample/press", 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

select * from comment;select * from post;select * from user;select * from vote;