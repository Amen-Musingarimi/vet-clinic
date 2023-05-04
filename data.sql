/* Populate database with sample data. */
-- Inserting data in the vets table
INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

-- Inserting data in the specializations table
INSERT INTO specializations (vet_id, species_id)
VALUES
  ((SELECT id FROM vets WHERE name = 'William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon')),
  ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon')),
  ((SELECT id FROM vets WHERE name = 'Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

-- Inserting data in the visits table
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(7, 2, '2020-01-05'),
(7, 2, '2020-03-08'),
(7, 2, '2020-05-14'),
(3, 3, '2021-05-04'),
(8, 4, '2021-02-24'),
(4, 1, '2020-08-10'),
(4, 2, '2021-04-07'),
(9, 3, '2019-09-29'),
(5, 4, '2020-10-03'),
(5, 4, '2020-11-04'),
(6, 4, '2005-06-06'),
(6, 2, '2019-01-24'),
(6, 2, '2019-05-15'),
(6, 2, '2020-02-27'),
(6, 2, '2020-08-03'),
(10, 1, '2021-01-11');



