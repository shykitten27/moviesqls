drop table movies;
drop table directors;

CREATE TABLE directors (
    director_id int NOT NULL primary key identity,
    first_name varchar(40) NOT NULL,
    last_name varchar(40),
	country varchar(80),
);

CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY identity,
   title VARCHAR(120),
   year_released INT,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

INSERT INTO directors (first_name, last_name, country)
VALUES ('John', 'Lasseter', 'USA');

INSERT INTO directors (first_name, last_name, country)
VALUES ('Brad', 'Bird', 'USA');

INSERT INTO directors (first_name, last_name, country)
VALUES ('Jodie', 'Foster', 'USA'); 

INSERT INTO directors (first_name, last_name, country)
VALUES ('Ang', 'Lee', 'Taiwan'); 

insert into directors (first_name, last_name, country)
values ('Alfonso', 'Cuarón', 'Mexico');

insert into directors (first_name, last_name, country)
values ('Guillermo', 'del Toro', 'Mexico');

insert into directors (first_name, last_name, country)
values ('Peter', 'Jackson', 'New Zealand');

insert into directors (first_name, last_name, country)
values ('Ava', 'DuVernay', 'USA');

insert into directors (first_name, last_name, country)
values ('Patty', 'Jenkins', 'USA');

insert into directors (first_name, last_name, country)
values ('Haifaa', 'al-Mansour', 'Saudi Arabia');

INSERT INTO movies (title, year_released, director_id)
VALUES ('Toy Story', 1995, 1);

INSERT INTO movies (title, year_released, director_id)
VALUES ('The Incredibles', 2004, 2);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Money Monster', 2016, 3);

INSERT INTO movies (title, year_released, director_id)
VALUES ('A Bug"s Life', 1998, 1);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Crouching Tiger, Hidden Dragon', 2000, 4);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Harry Potter and the Prisoner of Azkaban', 2004, 5);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Little Man Tate', 1991, 3);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Roma', 2018, 5);

INSERT INTO movies (title, year_released, director_id)
VALUES ('The Perfect Candidate', 2019, 10);

INSERT INTO movies (title, year_released, director_id)
VALUES ('The Shape of Water', 2017, 6);

INSERT INTO movies (title, year_released, director_id)
VALUES ('The Lord of the Rings: The Return of the King', 2003, 7);

INSERT INTO movies (title, year_released, director_id)
VALUES ('A Wrinkle in Time', 2018, 8);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Wonder Woman', 2017, 9);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Ratatouille', 2007, 2);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Mary Shelley', 2017, 10);

INSERT INTO movies (title, year_released, director_id)
VALUES ('Selma', 2014, 8);

select title from movies;

select title, year_released from movies
order by year_released desc;

select * from directors
order by country asc;

select * from directors
order by country asc, last_name asc;

INSERT INTO directors (first_name, last_name, country)
VALUES ('Rob', 'Reiner', 'USA'); 

select last_name, director_id from directors
where first_name='Rob' and last_name='Reiner';

select * from movies
inner join directors 
on movies.director_id=directors.director_id;

select title, first_name, last_name from movies
inner join directors 
on movies.director_id=directors.director_id
order by last_name asc;

--subquery vs join
select first_name, last_name from directors
where directors.director_id = 
(select director_id from movies
where title='The Incredibles');

--join vs subquery
select last_name, country from directors
inner join movies 
on directors.director_id=movies.director_id
where title='Roma';

--deleting movies without deleting director could result in a director with no movies listed and is allowed
--deleting directors without deleting corresponding movies could result in movies with no directors listed so it is not allowed (no orphans)
--parent-child relationship


select * from Movies;
select * from Directors;

delete from movies
where title='A Bug"s Life';

select * from Movies;
select * from Directors;

select * from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = 'Lasseter' and first_name='John';

delete from Directors
where last_name='Lasseter' and first_name='John';

delete from movies
where title='Toy Story';

select * from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = 'Lasseter' and first_name='John';

delete from Directors
where last_name='Lasseter' and first_name='John';

select * from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = 'Lasseter' and first_name='John';

select * from Movies;
select * from Directors;


select first_name as First, last_name as Last from directors
where directors.director_id = 
(select director_id, title from movies
where title='The Incredibles');

select title from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = 'Jackson' and first_name='Peter'

ALTER TABLE  movies
add money_earned decimal(13,2);

select * from movies;

update movies set money_earned=373554033 where title = 'Toy Story'; 
update movies set money_earned= 631441092 where title = 'The Incredibles'; 
update movies set money_earned= 93300000 where title = 'Money Monster'; 
update movies set money_earned= 200296754 where title = 'A Bug"s Life'; 
update movies set money_earned= 213500000 where title = 'Crouching Tiger, Hidden Dragon'; 
update movies set money_earned= 789961033 where title = 'Harry Potter and the Prisoner of Azkaban'; 
update movies set money_earned= 25000000 where title = 'Little Man Tate'; 
update movies set money_earned= 1109544 where title = 'Roma'; 	
update movies set money_earned= 1294943 where title = 'The Perfect Candidate';  
update movies set money_earned= 12640000 where title = 'The Shape of Water'; 
update movies set money_earned= 1146000000 where title = 'The Lord of the Rings: The Return of the King'; 
update movies set money_earned= 132700000 where title = 'A Wrinkle in Time'; 
update movies set money_earned= 818058221 where title = 'Wonder Woman'; 
update movies set money_earned= 623700000 where title = 'Ratatouille'; 
update movies set money_earned= 2792316 where title = 'Mary Shelley'; 
update movies set money_earned= 66776576 where title = 'Selma'; 
update movies set money_earned= 31045750 where title = 'The Princess Bride'; 

select * from movies;

select title, year_released, money_earned from movies
order by money_earned desc;

select title, year_released, money_earned from movies
where money_earned >= 500000000.00 --more than half billion
order by money_earned desc;

