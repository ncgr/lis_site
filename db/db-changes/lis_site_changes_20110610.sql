USE `lis_rails` ;

ALTER TABLE `lotja_contents`
DROP COLUMN `file_name` ,
DROP COLUMN `inbreeding` ,
DROP COLUMN `origin_lat` ,
DROP COLUMN `origin_long` ;


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
  `inbreeding` VARCHAR(255) NULL ,
  `wiki_link` VARCHAR(255) NULL ,
  `updated_at` DATETIME NULL ,
  `user_id` INT NULL ,
  `legume_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO medtr_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9);



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

INSERT INTO medtr_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `medtr_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);



DROP TABLE IF EXISTS `medtr_selected_references` ;

CREATE  TABLE IF NOT EXISTS `medtr_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `medtr_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO medtr_selected_references (`id`, `selected_references`, `medtr_content_id`) VALUES (1, NULL, 1);



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

INSERT INTO glyma_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4);


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

INSERT INTO glyma_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `glyma_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);


DROP TABLE IF EXISTS `glyma_selected_references` ;

CREATE  TABLE IF NOT EXISTS `glyma_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL DEFAULT NULL ,
  `glyma_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO glyma_selected_references (`id`, `selected_references`, `glyma_content_id`) VALUES (1, NULL, 1);

