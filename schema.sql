CREATE DATABASE catalog_of_thing;

CREATE TABLE author(
  ID SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);
  
CREATE TABLE label(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE genre(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_ID INT,
  author_ID INT,
  genre_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);
