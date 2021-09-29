drop table movies;
drop table directors;

CREATE TABLE directors (
   director_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   first_name VARCHAR(40),
   last_name VARCHAR(40),
   country VARCHAR(80)
);

CREATE TABLE movies (
   movie_id INTEGER PRIMARY KEY AUTO_INCREMENT,
   title VARCHAR(120),
   year_released YEAR,
   director_id INTEGER,
   FOREIGN KEY (director_id) REFERENCES directors(director_id)
);

##populate data by running C:\Users\dseid\launchcode\csharp-practice\Chpt17\Studio17-MovieSQLs\movie-buff-data
##I know how to do this in SQL, not yet in MySQL

select title from movies;

select title, year_released from movies
order by year_released desc;

select * from directors
order by country asc;

select * from directors
order by country asc, last_name asc;

INSERT INTO directors (first_name, last_name, country)
VALUES ("Rob", "Reiner", "USA"); 

select last_name, director_id from directors
where first_name="Rob" and last_name="Reiner";

select * from movies
inner join directors 
on movies.director_id=directors.director_id;

select title, first_name, last_name from movies
inner join directors 
on movies.director_id=directors.director_id
order by last_name asc;

##subquery vs join
select first_name, last_name from directors
where directors.director_id = 
(select director_id from movies
where title="The Incredibles");

##join vs subquery
select last_name, country from directors
inner join movies 
on directors.director_id=movies.director_id
where title="Roma";

##deleting movies without deleting director could result in a director with no movies listed and is allowed
##deleting directors without deleting corresponding movies could result in movies with no directors listed so it is not allowed (no orphans)
##parent-child relationship


select * from Movies;
select * from Directors;

delete from movies
where title="A Bug's Life";

select * from Movies;
select * from Directors;

select * from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = "Lasseter" and first_name="John";

delete from Directors
where last_name="Lasseter" and first_name="John";

delete from movies
where title="Toy Story";

select * from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = "Lasseter" and first_name="John";

delete from Directors
where last_name="Lasseter" and first_name="John";

select * from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = "Lasseter" and first_name="John";

select * from Movies;
select * from Directors;


select first_name as First, last_name as Last from directors
where directors.director_id = 
(select director_id, title from movies
where title="The Incredibles");

select title from movies
inner join directors
on movies.director_id=directors.director_id
where last_name = "Jackson" and first_name="Peter"

