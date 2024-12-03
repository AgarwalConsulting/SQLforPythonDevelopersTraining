CREATE TABLE person (
  name text,
  age integer,
  -- birth_time timestamp WITH time zone
  birth_time timestamp
);

INSERT INTO person (name, age, birth_time) VALUES ('Gaurav Agarwal', 33, '1991-05-07 10:00:00+05:30');
