/*Queries that provide answers to the questions from all projects.*/

SELECT * From animals WHERE name LIKE '%mon%';
SELECT * From animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND DATE '2019-12-31';
SELECT * From animals WHERE neutered = 'YES' AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon','Pikachu');
SELECT name, date_of_birth FROM animals WHERE weight_kg > 10.5;
SELECT * From animals WHERE neutered = 'YES';
SELECT * From animals WHERE name <> 'Gabumon';
SELECT * From animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;