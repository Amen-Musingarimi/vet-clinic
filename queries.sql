/*Queries that provide answers to the questions from all projects.*/

-- Who was the last animal seen by William Tatcher?
SELECT a.name 
FROM animals a 
JOIN visits v ON a.id = v.animal_id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'William Tatcher' 
ORDER BY v.visit_date DESC 
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT v.animal_id) 
FROM visits v 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vt.name, s.name AS specialty
FROM vets vt
LEFT JOIN specializations sp ON vt.id = sp.vet_id
LEFT JOIN species s ON s.id = sp.species_id
ORDER BY vt.name;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT a.name 
FROM animals a 
JOIN visits v ON a.id = v.animal_id 
JOIN vets vt ON v.vet_id = vt.id 
WHERE vt.name = 'Stephanie Mendez' 
AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT a.name AS animal_name, COUNT(*) AS visit_count 
FROM animals a 
JOIN visits v ON a.id = v.animal_id 
GROUP BY a.id 
ORDER BY visit_count DESC 
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT a.name AS animal_name, MIN(v.visit_date) AS first_visit
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON vt.id = v.vet_id
WHERE vt.name = 'Maisy Smith'
GROUP BY a.name;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT a.*, v.*, MAX(visits.visit_date) AS most_recent_visit_date
FROM visits
JOIN animals a ON visits.animal_id = a.id
JOIN vets v ON visits.vet_id = v.id
WHERE visits.visit_date = (SELECT MAX(visit_date) FROM visits)
GROUP BY a.id, v.id

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits v
INNER JOIN animals a ON a.id = v.animal_id
INNER JOIN vets vt ON vt.id = v.vet_id
LEFT JOIN specializations s ON vt.id = s.vet_id AND a.species_id = s.species_id
WHERE s.vet_id IS NULL;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT a.species_id, COUNT(*) AS num_visits
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id = (
  SELECT id FROM vets WHERE name = 'Maisy Smith'
)
GROUP BY a.species_id
ORDER BY num_visits DESC
LIMIT 1;
