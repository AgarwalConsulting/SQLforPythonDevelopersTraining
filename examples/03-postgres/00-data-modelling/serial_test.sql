CREATE TABLE person (
  -- id serial,
  id serial PRIMARY KEY,
  name text,
  age integer,
  birth_time timestamp WITH time zone
  -- birth_time timestamp
);

INSERT INTO person (name, age, birth_time) VALUES ('Gaurav Agarwal', 33, '1991-05-07 10:00:00+05:30');

INSERT INTO person (id, name, age, birth_time) VALUES (1000, 'Gaurav Agarwal', 33, '1991-05-07 10:00:00+05:30');

INSERT INTO person (name, age, birth_time) VALUES ('Gaurav Agarwal', 33, '1991-05-07 10:00:00+05:30');

INSERT INTO person (id, name, age, birth_time) VALUES (3, 'Gaurav Agarwal', 33, '1991-05-07 10:00:00+05:30');

INSERT INTO person (name, age, birth_time) VALUES ('Gaurav Agarwal', 33, '1991-05-07 10:00:00+05:30');
