PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows; 
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes; 
DROP TABLE IF EXISTS questions; 
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL, 
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY, 
    title TEXT NOT NULL, 
    body VARCHAR(255) NOT NULL,
    author_id INTEGER NOT NULL,
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_subject TEXT NOT NULL,
    parent_id INTEGER,
    author TEXT NOT NULL,
    body VARCHAR(255) NOT NULL,
    FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    num_likes INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    users (fname, lname)
VALUES
    ('Mike', 'Madsen'),
    ('Sam', 'Walker'),
    ('Michelle', 'Kim'),
    ('Joe', 'Bumbaca');

INSERT INTO 
    questions (title, body, author_id)
VALUES
    ('Weather', 'Is it sunny out?', 3),
    ('Help', 'How can I help?', 1);

INSERT INTO 
    question_follows (user_id, question_id)
VALUES
    (3, 1),
    (1, 2);

INSERT INTO 
    replies (question_subject, parent_id, author, body)
VALUES
    ('Weather', NULL, 'Joe', 'No, it is foggy today!'),
    ('Help', NULL, 'Walker', 'I do not need your help.'),
    ('Help', 2, 'Mike', 'Yes, you do.');

INSERT INTO 
    question_likes(num_likes, user_id, question_id)
VALUES
    (0, 3, 1),
    (0, 1, 2),
    (1, 4, 1),
    (2, 2, 1);
