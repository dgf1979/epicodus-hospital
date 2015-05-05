\c Guest

DROP DATABASE hospital;
DROP DATABASE hospital_test;

CREATE DATABASE hospital;

\c hospital

CREATE TABLE doctor (id serial PRIMARY KEY, name varchar, specialty_id int);

CREATE TABLE patient (id serial PRIMARY KEY, name varchar, birthdate timestamp, doctor_id int);

CREATE TABLE specialty (id serial PRIMARY KEY, description varchar);

INSERT INTO specialty (description) VALUES ('Family Medicine');
INSERT INTO specialty (description) VALUES ('Diagnostic');
INSERT INTO specialty (description) VALUES ('Oncology');
INSERT INTO specialty (description) VALUES ('Neurology');
INSERT INTO specialty (description) VALUES ('Surgery');
INSERT INTO specialty (description) VALUES ('Psychiatry');

CREATE DATABASE hospital_test WITH TEMPLATE hospital;

\c hospital_test

SELECT * FROM specialty
