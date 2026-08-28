CREATE DATABASE IF NOT EXISTS `nova`
DEFAULT CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE `nova`;

CREATE TABLE IF NOT EXISTS `nova_players` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `identifier` VARCHAR(150) NOT NULL,
    `name` VARCHAR(100) NOT NULL DEFAULT 'Unknown',
    `cash` INT NOT NULL DEFAULT 500,
    `bank` INT NOT NULL DEFAULT 2500,
    `job_name` VARCHAR(50) NOT NULL DEFAULT 'unemployed',
    `job_grade` INT NOT NULL DEFAULT 0,
    `permission_group` VARCHAR(30) NOT NULL DEFAULT 'user',
    `metadata` LONGTEXT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `nova_jobs` (
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `label` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `nova_jobs` (`name`, `label`) VALUES
('unemployed', 'Unemployed'),
('police', 'Police'),
('ambulance', 'EMS'),
('mechanic', 'Mechanic')
ON DUPLICATE KEY UPDATE label = VALUES(label);
