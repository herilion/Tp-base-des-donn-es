-- création de la base des données
CREATE DATABASE gouniv;
-- creation des tables
CREATE TABLE  IF NOT EXISTS staff(
    staff_no SERIAL PRIMARY KEY,
    name VARCHAR(250) NOT NULL DEFAULT 'PAS DE NOM',
    region VARCHAR(100) NOT NULL DEFAULT 'PAS DE REGION'
);
CREATE TABLE  IF NOT EXISTS student(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(250) NOT NULL DEFAULT 'PAS DE NOM',
    registered BOOLEAN NOT NULL DEFAULT FALSE,
    region VARCHAR(100) NOT NULL DEFAULT 'PAS DE REGION',
    staff_no INT REFERENCES staff(staff_no)

);
CREATE TABLE  IF NOT EXISTS course(
    course_code SERIAL PRIMARY KEY,
    title VARCHAR(250) NOT NULL DEFAULT 'PAS DE TITRE',
    credit INT NOT NULL DEFAULT 0,
    quota INT NOT NULL DEFAULT 0,
    staff_no INT REFERENCES staff(staff_no)

);
CREATE TABLE  IF NOT EXISTS assignement(
    assignement_id SERIAL PRIMARY KEY,
    staff_no INT REFERENCES staff(staff_no),
    student_id INT REFERENCES student(student_id),
    course_code INT REFERENCES course(course_code)

);
CREATE TABLE  IF NOT EXISTS enrolment(
    student_id INT REFERENCES student(student_id),
    course_code INT REFERENCES course(course_code),
    dateEnroled DATE NOT NULL DEFAULT current_date
);
-- -- creation des utilisations sous le terminal
CREATE USER admin;
CREATE USER assistant;
CREATE USER doyen;
-- -- donner un mot de passe à l'utilisateur admin
ALTER USER admin PASSWORD 'gouniv123';
-- -- se connecter à la base des données gouniv
\c gouniv;
-- -- donner toutes les privilèges de la base des données à l'utilisateur admin (faire de lui le propriétaire de la bdd)
ALTER DATABASE gouniv OWNER TO admin;
-- -- enlèver tout privilège de la base des données au public
REVOKE ALL PRIVILEGES ON DATABASE gouniv FROM PUBLIC;
-- -- donner tout privilè
-- -- REVOKE ALL PRIVILEGES ON DATABASE gouniv FROM PUBLIC;
-- -- REVOKE
-- -- GRANT ALL PRIVILEGES ON TABLE student,course TO doyen;
-- -- GRANT
-- -- GRANT SELECT ON TABLE staff TO doyen;
-- -- GRANT
-- -- GRANT SELECT ON TABLE student,course TO assistant;
-- -- GRANT
-- -- GRANT CONNECT ON DATABASE gouniv TO assistant,doyen;
