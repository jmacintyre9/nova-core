CREATE TABLE IF NOT EXISTS `nova_jobs` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_job_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nova_job_grades` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `job_name` VARCHAR(50) NOT NULL,
    `grade` INT NOT NULL DEFAULT 0,
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    `salary` INT NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `unique_job_grade` (`job_name`, `grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `nova_jobs` (`name`, `label`) VALUES
('unemployed', 'Unemployed'),
('police', 'Police'),
('ambulance', 'EMS'),
('mechanic', 'Mechanic')
ON DUPLICATE KEY UPDATE `label` = VALUES(`label`);

INSERT INTO `nova_job_grades`
(`job_name`, `grade`, `name`, `label`, `salary`) VALUES
('unemployed', 0, 'civilian', 'Civilian', 0),
('police', 0, 'recruit', 'Recruit', 500),
('police', 1, 'officer', 'Officer', 750),
('police', 2, 'sergeant', 'Sergeant', 1000),
('police', 3, 'lieutenant', 'Lieutenant', 1250),
('police', 4, 'chief', 'Chief', 1500),
('ambulance', 0, 'trainee', 'Trainee', 500),
('ambulance', 1, 'paramedic', 'Paramedic', 750),
('ambulance', 2, 'doctor', 'Doctor', 1000),
('ambulance', 3, 'chief', 'Chief', 1250),
('mechanic', 0, 'apprentice', 'Apprentice', 500),
('mechanic', 1, 'mechanic', 'Mechanic', 750),
('mechanic', 2, 'senior', 'Senior Mechanic', 1000),
('mechanic', 3, 'manager', 'Shop Manager', 1250)
ON DUPLICATE KEY UPDATE
    `label` = VALUES(`label`),
    `salary` = VALUES(`salary`);
