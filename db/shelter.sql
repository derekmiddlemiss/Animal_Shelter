DROP TABLE answers;
DROP TABLE questions;
DROP TABLE animals; 
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)  
);

CREATE TABLE animals (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  age INT,
  species VARCHAR(255),
  breed VARCHAR(255),
  picture_url TEXT,
  adoptable BOOLEAN,
  admission_date DATE,
  adoption_date DATE,
  owner_id INT4 REFERENCES owners(id)
);

CREATE TABLE questions (
  id SERIAL4 PRIMARY KEY,
  text TEXT
);

CREATE TABLE answers (
  id SERIAL4 PRIMARY KEY,
  question_id INT4 REFERENCES questions(id) ON DELETE CASCADE,
  owner_id INT4 REFERENCES owners(id) ON DELETE CASCADE,
  animal_id INT4 REFERENCES animals(id) ON DELETE CASCADE,
  own_answer TEXT,
  desired_answer TEXT,
  importance TEXT
) 
