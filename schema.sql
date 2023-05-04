/* Database schema to keep the structure of entire database. */
-- Create vets table
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  date_of_graduation DATE
);




