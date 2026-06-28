Create table employees(id, employee_id, name, email, department) 
CREATE TABLE trainings ( id INT PRIMARY KEY, training_name VARCHAR(100) NOT NULL );
INSERT INTO trainings (id, training_name) 
VALUES (1, 'security training'), (2, 'Emcee training'), (3, 'load testing training'), (4, 'Testing training'), (5, 'speaking training');

CREATE TABLE employee_trainings ( id INT PRIMARY KEY, employee_id INT, training_id INT, status VARCHAR(20), FOREIGN KEY (employee_id) REFERENCES employees(id), FOREIGN KEY (training_id) REFERENCES trainings(id) );
INSERT INTO employee_trainings (id, employee_id, training_id, status) 
VALUES (1, 1, 1, 'Completed'), (2, 1, 2, 'Completed'), (3, 2, 1, 'Pending'), (4, 2, 3, 'Completed'), (5, 3, 2, 'Completed'), (6, 3, 4, 'Pending'), (7, 4, 5, 'Completed'), (8, 4, 1, 'Completed'), (9, 5, 3, 'Pending'), (10, 5, 4, 'Completed');

CREATE TABLE certifications ( id INT PRIMARY KEY, employee_id INT, certification_name VARCHAR(100), expiry_date DATE, FOREIGN KEY (employee_id) REFERENCES employees(id) );
INSERT INTO certifications (id, employee_id, certification_name, expiry_date) VALUES 
(1, 1, 'security training', '2026-07-15'), (2, 2, 'Emcee training', '2026-08-20'), (3, 3, 'load testing training', '2026-06-30'), (4, 4, 'Testing training', '2026-09-10'), (5, 5, 'speaking training', '2026-07-05');

INSERT INTO employees (id, employee_id, name, email, department)
VALUES
(1, 'EMP001', 'Test1', 'test1@workforcepro.com', 'Quality Assurance'),
(2, 'EMP002', 'Test2', 'test2@workforcepro.com', 'Human Resources'),
(3, 'EMP003', 'Test 3', 'test3@workforcepro.com', 'Information Technology'),
(4, 'EMP004', 'test4', 'test4@workforcepro.com', 'Operations'),
(5, 'EMP005', 'test5', 'test5@workforcepro.com', 'Training');

/*Return employees who have completed trainings*/
SELECT employee_id
FROM employee_trainings
WHERE status = 'Completed';

/* Count trainings per employee*/
SELECT employee_id,
COUNT(training_id) AS total_trainings
FROM employee_trainings
GROUP BY employee_id;

/*Certifications expiring within 30 days*/
SELECT *
FROM certifications
WHERE expiry_date <= CURRENT_DATE + INTERVAL '30 DAY';

/*Top 5 Employees by Completed Trainings*/
SELECT employee_id,
COUNT(*) AS completed_trainings
FROM employee_trainings
WHERE status='Completed'
GROUP BY employee_id
ORDER BY completed_trainings DESC
LIMIT 5;

/*Employees with Overdue Trainings*/
SELECT employee_id
FROM employee_trainings
WHERE status != 'Completed'
AND due_date < CURRENT_DATE;



