drop table if exists category;

CREATE TABLE category (id int(11) NOT NULL AUTO_INCREMENT,name varchar(255) NOT NULL,description varchar(255) NOT NULL,PRIMARY KEY (`id`));


CREATE TABLE question (id int(11) NOT NULL AUTO_INCREMENT,queries varchar(255) DEFAULT NULL,answer varchar(255) DEFAULT NULL,posted_date datetime DEFAULT NULL,status varchar(255) DEFAULT NULL,category_id int(11) DEFAULT NULL,PRIMARY KEY (id),FOREIGN KEY (category_id) REFERENCES category (id));

insert into question (queries,answer,status,category_id) values ('what is java?','it is a programming language','answered');
insert into question (queries,status) values ('where are you?','Unanswered');
insert into question (queries,answer,status,category_id) values ('what is spring?','framework of frameworks','answered');

