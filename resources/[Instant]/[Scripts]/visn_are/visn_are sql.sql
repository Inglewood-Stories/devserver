ALTER TABLE `users` 
	ADD `healthData` TEXT NOT NULL DEFAULT '{\"bodyPulse\":80,\"bodyBloodLevel\":6.0,\"victimBleeding\":false,\"recievingBloodInfusion\":0,\"bodyPain\":0,\"bodyInPain\":false,\"bloodPressureL\":80.0,\"needSewed\":[],\"isUnconscious\":false,\"bloodPressureH\":120.0,\"logs\":[],\"bodyPartDamage\":{\"torso\":0,\"right_arm\":0,\"left_leg\":0,\"right_leg\":0,\"head\":0,\"left_arm\":0},\"bloodParts\":{\"torso\":0,\"right_arm\":0,\"left_leg\":0,\"right_leg\":0,\"head\":0,\"left_arm\":0}}'
;

-------- Weight --------
INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('bandage', 'Bandage', 10),
	('elastic_bandage', 'Elastic Bandage', 10),
	('packing_bandage', 'Packing Bandage', 10),
	('tourniquet', 'Tourniquet', 10),
	('surgical_kit', 'Surgical Kit', 10),
	('painkillers', 'Painkillers', 10),
	('bodybag', 'Bodybag', 10),
	('blood_100', 'Blood 100ml', 10),
	('blood_250', 'Blood 250ml', 10),
	('blood_500', 'Blood 500ml', 10),
	('blood_1000', 'Blood 1000ml', 10),
	('defibrilator', 'Defibrilator', 10),
	('epinephrine', 'Epinephrine', 10),
	('atropine', 'Atropine', 10),
	('morphin', 'Morphin', 10)
;

-------- Limit --------
INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('bandage', 'Bandage', 10),
	('elastic_bandage', 'Elastic Bandage', 10),
	('packing_bandage', 'Packing Bandage', 10),
	('tourniquet', 'Tourniquet', 10),
	('surgical_kit', 'Surgical Kit', 10),
	('painkillers', 'Painkillers', 10),
	('bodybag', 'Bodybag', 10),
	('blood_100', 'Blood 100ml', 10),
	('blood_250', 'Blood 250ml', 10),
	('blood_500', 'Blood 500ml', 10),
	('blood_1000', 'Blood 1000ml', 10),
	('defibrilator', 'Defibrilator', 10),
	('epinephrine', 'Epinephrine', 10),
	('atropine', 'Atropine', 10),
	('morphin', 'Morphin', 10)
;