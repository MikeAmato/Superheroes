DROP TABLE IF EXISTS superheroes;


CREATE TABLE superheroes(
id serial8 primary key,
hero_name varchar(20) not null,
alter_ego varchar(20) not null,
has_cape varchar(20) not null,
power varchar(20) not null,
arch_nemesis varchar(20) not null
);