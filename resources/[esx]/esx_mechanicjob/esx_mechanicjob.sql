USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_mechanic', 'Mechanic', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_mechanic', 'Mechanic', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('mechanic', 'Mechanic')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mechanic', 0, 'recruit', 'Recruit', 200, '{}', '{}'),
	('mechanic', 1, 'novice', 'Mechanic', 250, '{}', '{}'),
	('mechanic', 2, 'experimente', 'Lead Mechanic', 300, '{}', '{}'),
	('mechanic', 3, 'chief', 'Manager', 350, '{}', '{}'),
	('mechanic', 4, 'boss', 'Boss', 400, '{}', '{}')
;