CREATE TABLE `user` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`email` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`tag` VARCHAR(255) NOT NULL,
	`patient` VARCHAR(255) NOT NULL,
	`room` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `patient` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`userId` VARCHAR(255) NOT NULL UNIQUE,
	`roomId` VARCHAR(255) NOT NULL,
	`tag` VARCHAR(255) NOT NULL,
	`biodata` VARCHAR(255) NOT NULL,
	`medicalHistory` VARCHAR(255) NOT NULL,
	`schedule` VARCHAR(255) NOT NULL,
	`statistics` VARCHAR(255) NOT NULL,
	`position` VARCHAR(255) NOT NULL,
	`emergency` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `room` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`userId` VARCHAR(255) NOT NULL UNIQUE,
	`patient` VARCHAR(255) NOT NULL,
	`tag` VARCHAR(255) NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `biodata` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`patientId` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`age` VARCHAR(255) NOT NULL,
	`disease` VARCHAR(255) NOT NULL,
	`gender` VARCHAR(255) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	`phone` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`job` VARCHAR(255) NOT NULL,
	`family` VARCHAR(255) NOT NULL,
	`familyPhone` VARCHAR(255) NOT NULL,
	`avatar` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `medicalRecord` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`patientId` VARCHAR(255) NOT NULL UNIQUE,
	`medicalProblems` VARCHAR(255) NOT NULL,
	`healthIssues` VARCHAR(255) NOT NULL,
	`testResults` VARCHAR(255) NOT NULL,
	`medicines` VARCHAR(255) NOT NULL,
	`allergies` VARCHAR(255) NOT NULL,
	`surgeries` VARCHAR(255) NOT NULL,
	`immunizationsVaccines` VARCHAR(255) NOT NULL,
	`billingInsurances` VARCHAR(255) NOT NULL,
	`billingInsurances` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `schedule` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`patientId` VARCHAR(255) NOT NULL UNIQUE,
	`dailyVisit` VARCHAR(255) NOT NULL,
	`dailyMeal` VARCHAR(255) NOT NULL,
	`dailySnack` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `vital sign` (
	`id` VARCHAR(255) NOT NULL AUTO_INCREMENT UNIQUE,
	`patientId` VARCHAR(255) NOT NULL UNIQUE,
	`bloodPressure` VARCHAR(255) NOT NULL,
	`heartRate` VARCHAR(255) NOT NULL,
	`oxygenSaturate` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tag` (
	`id` VARCHAR(255) NOT NULL,
	`roomId` VARCHAR(255) NOT NULL,
	`userId` VARCHAR(255) NOT NULL,
	`patientId` VARCHAR(255) NOT NULL
);

ALTER TABLE `patient` ADD CONSTRAINT `patient_fk0` FOREIGN KEY (`userId`) REFERENCES `user`(`patient`);

ALTER TABLE `patient` ADD CONSTRAINT `patient_fk1` FOREIGN KEY (`roomId`) REFERENCES `room`(`patient`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk0` FOREIGN KEY (`userId`) REFERENCES `user`(`room`);

ALTER TABLE `biodata` ADD CONSTRAINT `biodata_fk0` FOREIGN KEY (`patientId`) REFERENCES `patient`(`biodata`);

ALTER TABLE `medicalRecord` ADD CONSTRAINT `medicalRecord_fk0` FOREIGN KEY (`patientId`) REFERENCES `patient`(`medicalHistory`);

ALTER TABLE `schedule` ADD CONSTRAINT `schedule_fk0` FOREIGN KEY (`patientId`) REFERENCES `patient`(`schedule`);

ALTER TABLE `vital sign` ADD CONSTRAINT `vital sign_fk0` FOREIGN KEY (`patientId`) REFERENCES `patient`(`statistics`);

ALTER TABLE `tag` ADD CONSTRAINT `tag_fk0` FOREIGN KEY (`roomId`) REFERENCES `room`(`tag`);

ALTER TABLE `tag` ADD CONSTRAINT `tag_fk1` FOREIGN KEY (`userId`) REFERENCES `user`(`tag`);

ALTER TABLE `tag` ADD CONSTRAINT `tag_fk2` FOREIGN KEY (`patientId`) REFERENCES `patient`(`tag`);









