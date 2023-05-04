/* Database schema to keep the structure of entire database. */
-- Create vets table
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  date_of_graduation DATE
);

-- Create specializations table
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

-- Create visits table
CREATE TABLE visits (
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE,
  PRIMARY KEY (animal_id, vet_id, visit_date)
);
