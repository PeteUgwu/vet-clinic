/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES 
('Agumon', '2020-02-03', 0, 'TRUE', 10.23),
('Gabumon', '2018-11-15', 2, 'TRUE', 8),
('Pikachu', '2021-01-07', 1, 'FALSE', 15.04),
('Devimon', '2017-05-12', 5, 'TRUE', 11);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES 
('Charmander', '2020-02-08', -11, 'FALSE', 0),
('Plantmon', '2021-11-15', -5.7, 'TRUE', 2),
('Squirtle', '1993-04-02', -12.13, 'FALSE', 3),
('Angemon', '2005-06-12', -45, 'TRUE', 1),
('Boarmon', '2005-06-07', 20.4, 'TRUE', 7),
('Blossom', '1998-10-13', 17, 'TRUE', 3),
('Ditto', '2022-05-14', 22, 'TRUE', 4);

INSERT INTO owners (full_name, age)
VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES
('Pokemon'),
('Digimon');

UPDATE animals SET species_id = CASE
  WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
  ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END;

UPDATE animals SET owner_id = CASE
WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHEN (name = 'Gabumon' OR name = 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHEN (name = 'Devimon' OR name = 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
WHEN (name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHEN (name = 'Angemon' OR name = 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;

INSERT INTO vet(name, age, date_of_graduation)
VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations(vet_id, species_id)
VALUES
(1, (SELECT id FROM species WHERE name = 'Pokemon')),
(3, (SELECT id FROM species WHERE name = 'Digimon')),
(3, (SELECT id FROM species WHERE name = 'Pokemon')),
(4, (SELECT id FROM species WHERE name = 'Digimon'));

  INSERT INTO visits (animal_id, vet_id, visit_date)
  VALUES  
  (1, 1, '2020-05-24'),
  (1, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (3, 2, '2020-01-05'),
  (3, 2, '2020-03-08'),
  (3, 2, '2020-05-14'),
  (4, 3, '2021-05-04'),
  (5, 4, '2021-02-24'),
  (6, 2, '2019-12-21'),
  (6, 1, '2020-08-10'),
  (6, 2, '2021-04-07'),
  (7, 3, '2019-09-29'),
  (8, 4, '2020-10-03'),
  (8, 4, '2020-11-04'),
  (9, 2, '2019-01-24'),
  (9, 2, '2019-05-15'),
  (9, 2, '2020-02-27'),
  (9, 2, '2020-08-03'),
  (10, 3, '2020-05-24'),
  (10, 1, '2021-01-11');