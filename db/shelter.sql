DROP TABLE animals; 
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  q_and_a_string TEXT  
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  age INT,
  species VARCHAR(255),
  breed VARCHAR(255),
  picture_url TEXT,
  q_and_a_string TEXT,
  adoptable BOOLEAN,
  admission_date DATE,
  adoption_date DATE,
  owner_id INT4 REFERENCES owners(id)
);
