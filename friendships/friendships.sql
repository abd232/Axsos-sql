SHOW TABLES;
DESCRIBE users;
DESCRIBE friendships;

INSERT INTO users(id, first_name, last_name, created_at, updated_at) 
VALUES (1, 'Abdallah', 'Abdalrhman', sysdate(), sysdate());
INSERT INTO users(id, first_name, last_name, created_at, updated_at) 
VALUES (2, 'Amy', 'Giver', sysdate(), sysdate());
INSERT INTO users(id, first_name, last_name, created_at, updated_at) 
VALUES (3, 'Eli', 'Byers', sysdate(), sysdate());
INSERT INTO users(id, first_name, last_name, created_at, updated_at) 
VALUES (4, 'Big', 'Bird', sysdate(), sysdate());
INSERT INTO users(id, first_name, last_name, created_at, updated_at) 
VALUES (5, 'Kermit', 'The Frog', sysdate(), sysdate());
INSERT INTO users(id, first_name, last_name, created_at, updated_at) 
VALUES (6, 'Marky', 'Mark', sysdate(), sysdate());

SELECT * FROM users;

ALTER TABLE friendships MODIFY id INT NOT NULL AUTO_INCREMENT;

INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (1, 2, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (1, 4, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (1, 6, sysdate(), sysdate());

INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (2, 1, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (2, 3, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (2, 5, sysdate(), sysdate());

INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (3, 2, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (3, 5, sysdate(), sysdate());

INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (4, 3, sysdate(), sysdate());

INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (5, 1, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (5, 6, sysdate(), sysdate());

INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (6, 2, sysdate(), sysdate());
INSERT INTO friendships(user_id, friend_id, created_at, updated_at)
VALUES (6, 3, sysdate(), sysdate());

SELECT * from friendships;

SELECT user1.first_name as friend_first_name, user1.last_name as friend_last_name,
	   user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM users as user1
JOIN friendships fs ON user1.id = fs.user_id
LEFT JOIN users as user2 ON fs.friend_id = user2.id;

SELECT user1.first_name as friend_first_name, user1.last_name as friend_last_name,
	   user2.first_name as friend_first_name, user2.last_name as friend_last_name
FROM users as user1
JOIN friendships fs ON user1.id = fs.user_id
LEFT JOIN users as user2 ON fs.friend_id = user2.id
WHERE user2.id = 1;

SELECT count(*) as 'number of friendships' FROM friendships;