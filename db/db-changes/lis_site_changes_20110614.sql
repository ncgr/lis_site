USE `lis_rails` ;

ALTER TABLE `news_articles`
CHANGE timestamp created_at DATETIME NULL ;


DROP TABLE IF EXISTS `medsa_contents` ;

CREATE  TABLE IF NOT EXISTS `medsa_contents` (
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

INSERT INTO medsa_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8);



DROP TABLE IF EXISTS `medsa_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `medsa_genome_summaries` (
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
  `medsa_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO medsa_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `medsa_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);



DROP TABLE IF EXISTS `medsa_selected_references` ;

CREATE  TABLE IF NOT EXISTS `medsa_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `medsa_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO medsa_selected_references (`id`, `selected_references`, `medsa_content_id`) VALUES (1, NULL, 1);

