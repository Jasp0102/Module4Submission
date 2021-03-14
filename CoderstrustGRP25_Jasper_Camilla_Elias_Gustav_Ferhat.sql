# Author: Jasper, Camilla, Ferhat, Gustav, Elias
# GRP. 25
# 14/03-2021


# deletes the schema if it exist, so its possible to keep exicuting for testing.
# Create schema, and makeing sure the script is using that schema.
drop schema if exists quiz;
create schema quiz;
use quiz;




# Creates our tables with PK, FK and atributes.
create table quiz (
  quiz_id int,
  date timestamp,
  quiz_desc varchar(255),
  primary key (quiz_id)
);

create table area (
  area_id int,
  area_def varchar(255),
  primary key (area_id)
);

create table question (
  question_id int,
  area_id int,
  question_desc varchar(255),
  primary key (question_id),
  foreign key (area_id) references area(area_id)
);

create table quiz_question (
  quiz_id int,
  question_id int,
  area_id int,
  foreign key (quiz_id) references quiz(quiz_id),
  foreign key (question_id) references question(question_id),
  foreign key (area_id) references area(area_id)
);

create table answer_option (
  answer_id int,
  answer_yn varchar(5),
  primary key (answer_id)
);

create table quiz_question_answer (
  quiz_id int,
  question_id int,
  area_id int,
  answer_id int,
  foreign key (quiz_id) references quiz_question(quiz_id),
  foreign key (question_id) references quiz_question(question_id),
  foreign key (area_id) references quiz_question(area_id),
  foreign key (answer_id) references answer_option(answer_id)
);

create table user (
  user_id int,
  first_name varchar(255),
  last_name varchar(255),
  Email varchar(255),
  primary key (user_id)
);

create table answer (
  quiz_id int,
  question_id int,
  area_id int,
  answer_id int,
  user_id int,
  foreign key (quiz_id) references quiz_question_answer(quiz_id),
  foreign key (question_id) references quiz_question_answer(question_id),
  foreign key (area_id) references quiz_question_answer(area_id),
  foreign key (answer_id) references quiz_question_answer(answer_id),
  foreign key (user_id) references user(user_id)
);


#Inserting values into our tables, as an example.
insert into quiz(quiz_id)
value (1101);

insert into area
  values
  (101, 'CREATIVE'),
  (102, 'DEVELOPMENT'),
  (103, 'DIGITAL MARKETING');

insert into question
  value
  (201, 101, 'Do you appreciate design in relation to products?'),
  (202, 101, 'Do you have a favourite artist when it comes to visual art?'),
  (203, 101, 'Do you enjoy making visual presentations for school or business?'),
  (204, 101, 'Have you tried editing video on your mobile device or PC?'),
  (205, 102, 'Do you like to take online intelligence tests?'),
  (206, 102, 'Do you find numbers and logic is preferred over philosophical questions?'),
  (207, 102, 'Are you interested in coding and learning to either understand or code yourself?'),
  (208, 102, 'Have you tried building a website with a CMS like wordpress or Wix?'),
  (209, 103, 'Are you very active on Social Media?'),
  (210, 103, 'Do you care about who likes and comments on your posts?'),
  (211, 103, 'Do you find that Social Media influences your buying decisions?'),
  (212, 103, 'Do you believe that Social Media is more effective than traditional marketing?');

insert into answer_option
  values
  (1, 'yes'),
  (2, 'no');

insert into user
  values
  (301, 'Michael', 'Jackson', 'michael@jackson.nu'),
  (302, 'Steve', 'Jobs', 'Stevejobs@apple.com');
  
insert into quiz_question
  values
  (1101, 201, 101),
  (1101, 202, 101),
  (1101, 203, 101),
  (1101, 204, 101),
  (1101, 205, 102),
  (1101, 206, 102),
  (1101, 207, 102),
  (1101, 208, 102),
  (1101, 209, 103),
  (1101, 210, 103),
  (1101, 211, 103),
  (1101, 212, 103);

insert into quiz_question_answer
  values
  (1101, 201, 101, 1),
  (1101, 202, 101, 1),
  (1101, 203, 101, 1),
  (1101, 204, 101, 1),
  (1101, 205, 102, 1),
  (1101, 206, 102, 1),
  (1101, 207, 102, 1),
  (1101, 208, 102, 1),
  (1101, 209, 103, 1),
  (1101, 210, 103, 1),
  (1101, 211, 103, 1),
  (1101, 212, 103, 1),
  (1101, 201, 101, 2),
  (1101, 202, 101, 2),
  (1101, 203, 101, 2),
  (1101, 204, 101, 2),
  (1101, 205, 102, 2),
  (1101, 206, 102, 2),
  (1101, 207, 102, 2),
  (1101, 208, 102, 2),
  (1101, 209, 103, 2),
  (1101, 210, 103, 2),
  (1101, 211, 103, 2),
  (1101, 212, 103, 2);

insert into answer
value
  (1101, 201, 101, 1, 301),
  (1101, 202, 101, 1, 301),
  (1101, 203, 101, 1, 301),
  (1101, 204, 101, 1, 301),
  (1101, 205, 102, 2, 301),
  (1101, 206, 102, 2, 301),
  (1101, 207, 102, 1, 301),
  (1101, 208, 102, 2, 301),
  (1101, 209, 103, 2, 301),
  (1101, 210, 103, 2, 301),
  (1101, 211, 103, 1, 301),
  (1101, 212, 103, 1, 301),
  (1101, 201, 101, 2, 302),
  (1101, 202, 101, 2, 302),
  (1101, 203, 101, 1, 302),
  (1101, 204, 101, 2, 302),
  (1101, 205, 102, 1, 302),
  (1101, 206, 102, 2, 302),
  (1101, 207, 102, 2, 302),
  (1101, 208, 102, 2, 302),
  (1101, 209, 103, 2, 302),
  (1101, 210, 103, 1, 302),
  (1101, 211, 103, 1, 302),
  (1101, 212, 103, 1, 302);
  
  
# Making a table for calculating the users test result.
# counts every case where answer is 'yes' in each category.
create table result
select answer.user_id, answer.answer_id,
count(case when answer.area_id = 101 then 1 end) creative,
count(case when answer.area_id = 102 then 1 end) development,
count(case when answer.area_id = 103 then 1 end) digital_marketing
from answer
group by answer.user_id, answer.answer_id;

#Adding FK's to make sure result table has proper relations to answer table.
alter table result
add foreign key (user_id) references answer(user_id),
add foreign key (answer_id) references answer(answer_id);


#Creating a view, that works as our point system, by multiplying number of 'yes' answers by 5 and grouping by user.
CREATE VIEW score AS
    SELECT 
        user_id AS user_,
        creative * 5 AS CREATIVE,
        development * 5 AS DEVELOPMENT,
        digital_marketing * 5 AS 'DIGITAL MARKETING'
    FROM
        result
    GROUP BY user_id;