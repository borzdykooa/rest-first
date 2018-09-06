CREATE DATABASE rest_database;
USE rest_database;

CREATE TABLE trainer (
  id         BIGINT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(32) NOT NULL,
  language   VARCHAR(16) NOT NULL,
  experience INTEGER     NOT NULL
);

CREATE TABLE trainee (
  id         BIGINT PRIMARY KEY AUTO_INCREMENT,
  name       VARCHAR(32) NOT NULL,
  trainer_id BIGINT REFERENCES rest_database.trainer (id)
);

INSERT INTO rest_database.trainer (name, language, experience) VALUES
  ('Andrei Reut', 'Java', 6),
  ('Ivan Ivanov', 'C++', 4),
  ('Petr Petrov', 'C#', 5);

INSERT INTO rest_database.trainee (name, trainer_id) VALUES
  ('Olga Borzdyko', (SELECT id
                     FROM rest_database.trainer
                     WHERE trainer.name = 'Andrei Reut')),
  ('Denis Byhovsky', (SELECT id
                      FROM rest_database.trainer
                      WHERE trainer.name = 'Andrei Reut')),
  ('Sergei Sergeev', (SELECT id
                      FROM rest_database.trainer
                      WHERE trainer.name = 'Andrei Reut'));

