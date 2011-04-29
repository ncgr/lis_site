SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `lis_rails` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `lis_rails` ;

-- -----------------------------------------------------
-- Table `development_activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `development_activities` ;

CREATE  TABLE IF NOT EXISTS `development_activities` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `body` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `date` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 130
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `meetings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meetings` ;

CREATE  TABLE IF NOT EXISTS `meetings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `url` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `start_date` DATE NULL DEFAULT NULL ,
  `end_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `news_articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `news_articles` ;

CREATE  TABLE IF NOT EXISTS `news_articles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `body` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL COMMENT 'Add \\n for a new line. Rails will replace \\n with HTML.' ,
  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `roles` ;

CREATE  TABLE IF NOT EXISTS `roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

CREATE  TABLE IF NOT EXISTS `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `encrypted_password` VARCHAR(128) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `password_salt` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `reset_password_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `remember_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `remember_created_at` DATETIME NULL DEFAULT NULL ,
  `sign_in_count` INT(11) NULL DEFAULT '0' ,
  `current_sign_in_at` DATETIME NULL DEFAULT NULL ,
  `last_sign_in_at` DATETIME NULL DEFAULT NULL ,
  `current_sign_in_ip` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `last_sign_in_ip` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `failed_attempts` INT(11) NULL DEFAULT '0' ,
  `unlock_token` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `locked_at` DATETIME NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  `first_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `last_name` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `invitation_token` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `invitation_sent_at` DATETIME NULL DEFAULT NULL ,
  `invitation_limit` INT(11) NULL DEFAULT NULL ,
  `invited_by_id` INT(11) NULL DEFAULT NULL ,
  `invited_by_type` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `index_users_on_username` (`username` ASC) ,
  UNIQUE INDEX `index_users_on_reset_password_token` (`reset_password_token` ASC) ,
  UNIQUE INDEX `index_users_on_unlock_token` (`unlock_token` ASC) ,
  INDEX `index_users_on_invitation_token` (`invitation_token` ASC) ,
  INDEX `index_users_on_invited_by_id` (`invited_by_id` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `user_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_roles` ;

CREATE  TABLE IF NOT EXISTS `user_roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `user_id` INT(11) NOT NULL ,
  `role_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `medtr_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medtr_contents` ;

CREATE  TABLE IF NOT EXISTS `medtr_contents` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `overview` TEXT NULL ,
  `genome_summary` TEXT NULL ,
  `resources` TEXT NULL ,
  `selected_references` TEXT NULL ,
  `file_name` VARCHAR(255) NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `phavu_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phavu_contents` ;

CREATE  TABLE IF NOT EXISTS `phavu_contents` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `overview` TEXT NULL ,
  `genome_summary` TEXT NULL ,
  `resources` TEXT NULL ,
  `selected_references` TEXT NULL ,
  `file_name` VARCHAR(255) NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lotja_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lotja_contents` ;

CREATE  TABLE IF NOT EXISTS `lotja_contents` (
  `id` INT NOT NULL ,
  `overview` TEXT NULL ,
  `genome_summary` TEXT NULL ,
  `resources` TEXT NULL ,
  `selected_references` TEXT NULL ,
  `file_name` VARCHAR(255) NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO roles (`id`, `name`) VALUES (1, 'superuser');
INSERT INTO roles (`id`, `name`) VALUES (2, 'admin');
INSERT INTO roles (`id`, `name`) VALUES (3, 'editor');
INSERT INTO roles (`id`, `name`) VALUES (4, 'system_user');

COMMIT;

-- -----------------------------------------------------
-- Data for table `medtr_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medtr_contents (`id`, `overview`, `genome_summary`, `resources`, `selected_references`, `file_name`, `updated_at`, `user_id`) VALUES (1, '', '', '', '', NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `phavu_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO phavu_contents (`id`, `overview`, `genome_summary`, `resources`, `selected_references`, `file_name`, `updated_at`, `user_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `lotja_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO lotja_contents (`id`, `overview`, `genome_summary`, `resources`, `selected_references`, `file_name`, `updated_at`, `user_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

COMMIT;
