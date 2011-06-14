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
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `meetings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meetings` ;

CREATE  TABLE IF NOT EXISTS `meetings` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `url` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `start_date` DATE NULL DEFAULT NULL ,
  `end_date` DATE NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
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
  `created_at` DATETIME NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
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
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `index_users_on_username` (`username` ASC) ,
  UNIQUE INDEX `index_users_on_reset_password_token` (`reset_password_token` ASC) ,
  UNIQUE INDEX `index_users_on_unlock_token` (`unlock_token` ASC) )
ENGINE = InnoDB
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
-- Table `legumes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `legumes` ;

CREATE  TABLE IF NOT EXISTS `legumes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `short_name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  UNIQUE INDEX `short_name_UNIQUE` (`short_name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medtr_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medtr_contents` ;

CREATE  TABLE IF NOT EXISTS `medtr_contents` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `overview` TEXT NULL ,
  `taxon_id` VARCHAR(255) NULL ,
  `special_interest` TEXT NULL ,
  `nodulation_type` VARCHAR(255) NULL ,
  `nodulation_type_information` TEXT NULL ,
  `nodulator_species` VARCHAR(255) NULL ,
  `nodulator_taxon_id` VARCHAR(255) NULL ,
  `flowering_type` VARCHAR(255) NULL ,
  `flowering_type_information` TEXT NULL ,
  `pollination_type` VARCHAR(255) NULL ,
  `pollination_type_information` TEXT NULL ,
  `self_incompatibility` VARCHAR(255) NULL ,
  `wiki_link` VARCHAR(255) NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  `legume_id` INT NOT NULL ,
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
  `legume_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lotja_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lotja_contents` ;

CREATE  TABLE IF NOT EXISTS `lotja_contents` (
  `id` INT NOT NULL ,
  `overview` TEXT NULL ,
  `taxon_id` VARCHAR(255) NULL ,
  `special_interest` TEXT NULL ,
  `nodulation_type` VARCHAR(255) NULL ,
  `nodulation_type_information` TEXT NULL ,
  `nodulator_species` VARCHAR(255) NULL ,
  `nodulator_taxon_id` VARCHAR(255) NULL ,
  `flowering_type` VARCHAR(255) NULL ,
  `flowering_type_information` TEXT NULL ,
  `pollination_type` VARCHAR(255) NULL ,
  `pollination_type_information` TEXT NULL ,
  `self_incompatibility` VARCHAR(255) NULL ,
  `wiki_link` VARCHAR(255) NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  `legume_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `glyma_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `glyma_contents` ;

CREATE  TABLE IF NOT EXISTS `glyma_contents` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `overview` TEXT NULL DEFAULT NULL ,
  `taxon_id` VARCHAR(255) NULL DEFAULT NULL ,
  `special_interest` TEXT NULL DEFAULT NULL ,
  `nodulation_type` VARCHAR(255) NULL DEFAULT NULL ,
  `nodulation_type_information` TEXT NULL DEFAULT NULL ,
  `nodulator_species` VARCHAR(255) NULL DEFAULT NULL ,
  `nodulator_taxon_id` VARCHAR(255) NULL DEFAULT NULL ,
  `flowering_type` VARCHAR(255) NULL DEFAULT NULL ,
  `flowering_type_information` TEXT NULL DEFAULT NULL ,
  `pollination_type` VARCHAR(255) NULL DEFAULT NULL ,
  `pollination_type_information` TEXT NULL DEFAULT NULL ,
  `self_incompatibility` VARCHAR(255) NULL DEFAULT NULL ,
  `inbreeding` VARCHAR(255) NULL DEFAULT NULL ,
  `wiki_link` VARCHAR(255) NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  `user_id` INT NULL DEFAULT NULL ,
  `legume_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pathogens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pathogens` ;

CREATE  TABLE IF NOT EXISTS `pathogens` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `legume_id` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `ncbi_taxon_id` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pages` ;

CREATE  TABLE IF NOT EXISTS `pages` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(255) NULL ,
  `body` TEXT NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sessions` ;

CREATE  TABLE IF NOT EXISTS `sessions` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `session_id` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL ,
  `data` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL ,
  `created_at` DATETIME NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `index_sessions_on_session_id` (`session_id` ASC) ,
  INDEX `index_sessions_on_updated_at` (`updated_at` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lotja_genome_summaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lotja_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `lotja_genome_summaries` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `genome_summary` TEXT NULL ,
  `chromosomes` VARCHAR(255) NULL ,
  `genome_size` VARCHAR(255) NULL ,
  `genome_size_information` TEXT NULL ,
  `ploidy_type` VARCHAR(255) NULL ,
  `gc_content_genome` VARCHAR(255) NULL ,
  `gc_content_genome_information` TEXT NULL ,
  `gc_content_transcriptome` VARCHAR(255) NULL ,
  `gc_content_transcriptome_information` TEXT NULL ,
  `chloroplast_genome_size` VARCHAR(255) NULL ,
  `chloroplast_genome_size_information` TEXT NULL ,
  `chloroplast_accession_number` VARCHAR(255) NULL ,
  `mitochondria_genome_size` VARCHAR(255) NULL ,
  `mitochondria_genome_size_information` TEXT NULL ,
  `mitochondria_accession_number` VARCHAR(255) NULL ,
  `lotja_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lotja_selected_references`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lotja_selected_references` ;

CREATE  TABLE IF NOT EXISTS `lotja_selected_references` (
  `id` INT NOT NULL ,
  `selected_references` TEXT NULL ,
  `lotja_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `reference_datasets`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `reference_datasets` ;

CREATE  TABLE IF NOT EXISTS `reference_datasets` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `legume_id` INT NOT NULL ,
  `reference_dataset_type` VARCHAR(255) NULL ,
  `description` VARCHAR(255) NULL ,
  `source` VARCHAR(255) NULL ,
  `url` VARCHAR(255) NULL ,
  `is_public` TINYINT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resources`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resources` ;

CREATE  TABLE IF NOT EXISTS `resources` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `legume_id` INT NOT NULL ,
  `resource_type` VARCHAR(255) NULL ,
  `description` VARCHAR(255) NULL ,
  `url` VARCHAR(255) NULL ,
  `is_public` TINYINT NULL DEFAULT 1 ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medtr_selected_references`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medtr_selected_references` ;

CREATE  TABLE IF NOT EXISTS `medtr_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `medtr_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medtr_genome_summaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medtr_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `medtr_genome_summaries` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `genome_summary` TEXT NULL ,
  `chromosomes` VARCHAR(255) NULL ,
  `genome_size` VARCHAR(255) NULL ,
  `genome_size_information` TEXT NULL ,
  `ploidy_type` VARCHAR(255) NULL ,
  `gc_content_genome` VARCHAR(255) NULL ,
  `gc_content_genome_information` TEXT NULL ,
  `gc_content_transcriptome` VARCHAR(255) NULL ,
  `gc_content_transcriptome_information` TEXT NULL ,
  `chloroplast_genome_size` VARCHAR(255) NULL ,
  `chloroplast_genome_size_information` TEXT NULL ,
  `chloroplast_accession_number` VARCHAR(255) NULL ,
  `mitochondria_genome_size` VARCHAR(255) NULL ,
  `mitochondria_genome_size_information` TEXT NULL ,
  `mitochondria_accession_number` VARCHAR(255) NULL ,
  `medtr_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `glyma_genome_summaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `glyma_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `glyma_genome_summaries` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `genome_summary` TEXT NULL DEFAULT NULL ,
  `chromosomes` VARCHAR(255) NULL DEFAULT NULL ,
  `genome_size` VARCHAR(255) NULL DEFAULT NULL ,
  `genome_size_information` TEXT NULL DEFAULT NULL ,
  `ploidy_type` VARCHAR(255) NULL DEFAULT NULL ,
  `gc_content_genome` VARCHAR(255) NULL DEFAULT NULL ,
  `gc_content_genome_information` TEXT NULL DEFAULT NULL ,
  `gc_content_transcriptome` VARCHAR(255) NULL DEFAULT NULL ,
  `gc_content_transcriptome_information` TEXT NULL DEFAULT NULL ,
  `chloroplast_genome_size` VARCHAR(255) NULL DEFAULT NULL ,
  `chloroplast_genome_size_information` TEXT NULL DEFAULT NULL ,
  `chloroplast_accession_number` VARCHAR(255) NULL DEFAULT NULL ,
  `mitochondria_genome_size` VARCHAR(255) NULL DEFAULT NULL ,
  `mitochondria_genome_size_information` TEXT NULL DEFAULT NULL ,
  `mitochondria_accession_number` VARCHAR(255) NULL DEFAULT NULL ,
  `glyma_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `glyma_selected_references`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `glyma_selected_references` ;

CREATE  TABLE IF NOT EXISTS `glyma_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL DEFAULT NULL ,
  `glyma_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medsa_contents`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medsa_contents` ;

CREATE  TABLE IF NOT EXISTS `medsa_contents` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `overview` TEXT NULL DEFAULT NULL ,
  `taxon_id` VARCHAR(255) NULL DEFAULT NULL ,
  `special_interest` TEXT NULL DEFAULT NULL ,
  `nodulation_type` VARCHAR(255) NULL DEFAULT NULL ,
  `nodulation_type_information` TEXT NULL DEFAULT NULL ,
  `nodulator_species` VARCHAR(255) NULL DEFAULT NULL ,
  `nodulator_taxon_id` VARCHAR(255) NULL DEFAULT NULL ,
  `flowering_type` VARCHAR(255) NULL DEFAULT NULL ,
  `flowering_type_information` TEXT NULL DEFAULT NULL ,
  `pollination_type` VARCHAR(255) NULL DEFAULT NULL ,
  `pollination_type_information` TEXT NULL DEFAULT NULL ,
  `self_incompatibility` VARCHAR(255) NULL DEFAULT NULL ,
  `inbreeding` VARCHAR(255) NULL DEFAULT NULL ,
  `wiki_link` VARCHAR(255) NULL DEFAULT NULL ,
  `updated_at` DATETIME NULL DEFAULT NULL ,
  `user_id` INT NULL DEFAULT NULL ,
  `legume_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medsa_genome_summaries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medsa_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `medsa_genome_summaries` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `genome_summary` TEXT NULL DEFAULT NULL ,
  `chromosomes` VARCHAR(255) NULL DEFAULT NULL ,
  `genome_size` VARCHAR(255) NULL DEFAULT NULL ,
  `genome_size_information` TEXT NULL DEFAULT NULL ,
  `ploidy_type` VARCHAR(255) NULL DEFAULT NULL ,
  `gc_content_genome` VARCHAR(255) NULL DEFAULT NULL ,
  `gc_content_genome_information` TEXT NULL DEFAULT NULL ,
  `gc_content_transcriptome` VARCHAR(255) NULL DEFAULT NULL ,
  `gc_content_transcriptome_information` TEXT NULL DEFAULT NULL ,
  `chloroplast_genome_size` VARCHAR(255) NULL DEFAULT NULL ,
  `chloroplast_genome_size_information` TEXT NULL DEFAULT NULL ,
  `chloroplast_accession_number` VARCHAR(255) NULL DEFAULT NULL ,
  `mitochondria_genome_size` VARCHAR(255) NULL DEFAULT NULL ,
  `mitochondria_genome_size_information` TEXT NULL DEFAULT NULL ,
  `mitochondria_accession_number` VARCHAR(255) NULL DEFAULT NULL ,
  `medsa_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medsa_selected_references`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medsa_selected_references` ;

CREATE  TABLE IF NOT EXISTS `medsa_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL DEFAULT NULL ,
  `medsa_content_id` INT NOT NULL ,
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
-- Data for table `legumes`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (1, 'Arachis hypogaea (peanut)', 'arahy');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (2, 'Cajanus cajan (pigeon pea)', 'cajca');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (3, 'Cicer arietinum (chickpea)', 'cicar');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (4, 'Glycine max (soybean)', 'glyma');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (5, 'Lens culinaris (lentil)', 'lencu');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (6, 'Lotus japonicus (birdsfoot trefoil)', 'lotja');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (7, 'Lupinus angustifolius (blue lupin)', 'lupan');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (8, 'Medicago sativa (alfalfa)', 'medsa');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (9, 'Medicago truncatula (barrel medic)', 'medtr');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (10, 'Pisum sativum (garden pea)', 'pea');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (11, 'Phaseolus coccineus (scarlet runner bean)', 'phacn');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (12, 'Phaseolus vulgaris (common bean)', 'phavu');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (13, 'Vicia faba (broad bean)', 'vicfa');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (14, 'Vigna radiata (mung bean)', 'vigra');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (15, 'Vigna unguiculata (cowpea)', 'vigun');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (16, 'Chamaecrista fasciculata (partridge pea)', 'chafs');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (17, 'Lupinus albus (white lupin)', 'lupal');
INSERT INTO legumes (`id`, `name`, `short_name`) VALUES (18, 'Trifolium pratense (red clover)', 'tripr');

COMMIT;

-- -----------------------------------------------------
-- Data for table `medtr_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medtr_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);

COMMIT;

-- -----------------------------------------------------
-- Data for table `phavu_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO phavu_contents (`id`, `overview`, `genome_summary`, `resources`, `selected_references`, `file_name`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12);

COMMIT;

-- -----------------------------------------------------
-- Data for table `lotja_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO lotja_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6);

COMMIT;

-- -----------------------------------------------------
-- Data for table `glyma_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO glyma_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);

COMMIT;

-- -----------------------------------------------------
-- Data for table `pages`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO pages (`id`, `title`, `body`, `updated_at`, `user_id`) VALUES (1, 'about', NULL, NULL, NULL);
INSERT INTO pages (`id`, `title`, `body`, `updated_at`, `user_id`) VALUES (2, 'collaborators', NULL, NULL, NULL);
INSERT INTO pages (`id`, `title`, `body`, `updated_at`, `user_id`) VALUES (3, 'links', NULL, NULL, NULL);
INSERT INTO pages (`id`, `title`, `body`, `updated_at`, `user_id`) VALUES (4, 'participating_groups', NULL, NULL, NULL);
INSERT INTO pages (`id`, `title`, `body`, `updated_at`, `user_id`) VALUES (5, 'species', NULL, NULL, NULL);
INSERT INTO pages (`id`, `title`, `body`, `updated_at`, `user_id`) VALUES (6, 'welcome', NULL, NULL, NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `lotja_genome_summaries`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO lotja_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `lotja_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `lotja_selected_references`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO lotja_selected_references (`id`, `selected_references`, `lotja_content_id`) VALUES (1, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `medtr_selected_references`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medtr_selected_references (`id`, `selected_references`, `medtr_content_id`) VALUES (1, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `medtr_genome_summaries`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medtr_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `medtr_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `glyma_genome_summaries`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO glyma_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `glyma_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `glyma_selected_references`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO glyma_selected_references (`id`, `selected_references`, `glyma_content_id`) VALUES (1, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `medsa_contents`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medsa_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8);

COMMIT;

-- -----------------------------------------------------
-- Data for table `medsa_genome_summaries`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medsa_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `medsa_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

COMMIT;

-- -----------------------------------------------------
-- Data for table `medsa_selected_references`
-- -----------------------------------------------------
START TRANSACTION;
USE `lis_rails`;
INSERT INTO medsa_selected_references (`id`, `selected_references`, `medsa_content_id`) VALUES (1, NULL, 1);

COMMIT;
