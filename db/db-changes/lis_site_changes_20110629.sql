USE `lis_rails` ;


DROP TABLE IF EXISTS `arahy_contents` ;

CREATE  TABLE IF NOT EXISTS `arahy_contents` (
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

INSERT INTO arahy_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `arahy_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `arahy_genome_summaries` (
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
  `arahy_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO arahy_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `arahy_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `arahy_selected_references` ;

CREATE  TABLE IF NOT EXISTS `arahy_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `arahy_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO arahy_selected_references (`id`, `selected_references`, `arahy_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `cajca_contents` ;

CREATE  TABLE IF NOT EXISTS `cajca_contents` (
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

INSERT INTO cajca_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

DROP TABLE IF EXISTS `cajca_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `cajca_genome_summaries` (
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
  `cajca_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO cajca_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `cajca_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `cajca_selected_references` ;

CREATE  TABLE IF NOT EXISTS `cajca_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `cajca_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO cajca_selected_references (`id`, `selected_references`, `cajca_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `chafs_contents` ;

CREATE  TABLE IF NOT EXISTS `chafs_contents` (
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

INSERT INTO chafs_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16);

DROP TABLE IF EXISTS `chafs_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `chafs_genome_summaries` (
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
  `chafs_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO chafs_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `chafs_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `chafs_selected_references` ;

CREATE  TABLE IF NOT EXISTS `chafs_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `chafs_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO chafs_selected_references (`id`, `selected_references`, `chafs_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `cicar_contents` ;

CREATE  TABLE IF NOT EXISTS `cicar_contents` (
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

INSERT INTO cicar_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3);

DROP TABLE IF EXISTS `cicar_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `cicar_genome_summaries` (
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
  `cicar_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO cicar_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `cicar_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `cicar_selected_references` ;

CREATE  TABLE IF NOT EXISTS `cicar_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `cicar_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO cicar_selected_references (`id`, `selected_references`, `cicar_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `lencu_contents` ;

CREATE  TABLE IF NOT EXISTS `lencu_contents` (
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

INSERT INTO lencu_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5);

DROP TABLE IF EXISTS `lencu_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `lencu_genome_summaries` (
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
  `lencu_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO lencu_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `lencu_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `lencu_selected_references` ;

CREATE  TABLE IF NOT EXISTS `lencu_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `lencu_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO lencu_selected_references (`id`, `selected_references`, `lencu_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `lupal_contents` ;

CREATE  TABLE IF NOT EXISTS `lupal_contents` (
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

INSERT INTO lupal_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17);

DROP TABLE IF EXISTS `lupal_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `lupal_genome_summaries` (
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
  `lupal_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO lupal_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `lupal_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `lupal_selected_references` ;

CREATE  TABLE IF NOT EXISTS `lupal_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `lupal_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO lupal_selected_references (`id`, `selected_references`, `lupal_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `lupan_contents` ;

CREATE  TABLE IF NOT EXISTS `lupan_contents` (
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

INSERT INTO lupan_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7);

DROP TABLE IF EXISTS `lupan_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `lupan_genome_summaries` (
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
  `lupan_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO lupan_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `lupan_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `lupan_selected_references` ;

CREATE  TABLE IF NOT EXISTS `lupan_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `lupan_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO lupan_selected_references (`id`, `selected_references`, `lupan_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `pea_contents` ;

CREATE  TABLE IF NOT EXISTS `pea_contents` (
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

INSERT INTO pea_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10);

DROP TABLE IF EXISTS `pea_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `pea_genome_summaries` (
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
  `pea_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO pea_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `pea_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `pea_selected_references` ;

CREATE  TABLE IF NOT EXISTS `pea_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `pea_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO pea_selected_references (`id`, `selected_references`, `pea_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `phacn_contents` ;

CREATE  TABLE IF NOT EXISTS `phacn_contents` (
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

INSERT INTO phacn_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11);

DROP TABLE IF EXISTS `phacn_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `phacn_genome_summaries` (
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
  `phacn_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO phacn_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `phacn_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `phacn_selected_references` ;

CREATE  TABLE IF NOT EXISTS `phacn_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `phacn_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO phacn_selected_references (`id`, `selected_references`, `phacn_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `tripr_contents` ;

CREATE  TABLE IF NOT EXISTS `tripr_contents` (
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

INSERT INTO tripr_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18);

DROP TABLE IF EXISTS `tripr_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `tripr_genome_summaries` (
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
  `tripr_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO tripr_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `tripr_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `tripr_selected_references` ;

CREATE  TABLE IF NOT EXISTS `tripr_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `tripr_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO tripr_selected_references (`id`, `selected_references`, `tripr_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `vicfa_contents` ;

CREATE  TABLE IF NOT EXISTS `vicfa_contents` (
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

INSERT INTO vicfa_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13);

DROP TABLE IF EXISTS `vicfa_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `vicfa_genome_summaries` (
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
  `vicfa_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO vicfa_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `vicfa_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `vicfa_selected_references` ;

CREATE  TABLE IF NOT EXISTS `vicfa_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `vicfa_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO vicfa_selected_references (`id`, `selected_references`, `vicfa_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `vigra_contents` ;

CREATE  TABLE IF NOT EXISTS `vigra_contents` (
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

INSERT INTO vigra_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14);

DROP TABLE IF EXISTS `vigra_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `vigra_genome_summaries` (
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
  `vigra_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO vigra_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `vigra_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `vigra_selected_references` ;

CREATE  TABLE IF NOT EXISTS `vigra_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `vigra_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO vigra_selected_references (`id`, `selected_references`, `vigra_content_id`) VALUES (1, NULL, 1);




DROP TABLE IF EXISTS `vigun_contents` ;

CREATE  TABLE IF NOT EXISTS `vigun_contents` (
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

INSERT INTO vigun_contents (`id`, `overview`, `taxon_id`, `special_interest`, `nodulation_type`, `nodulation_type_information`, `nodulator_species`, `nodulator_taxon_id`, `flowering_type`, `flowering_type_information`, `pollination_type`, `pollination_type_information`, `self_incompatibility`, `inbreeding`, `wiki_link`, `updated_at`, `user_id`, `legume_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15);

DROP TABLE IF EXISTS `vigun_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `vigun_genome_summaries` (
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
  `vigun_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO vigun_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `vigun_content_id`) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

DROP TABLE IF EXISTS `vigun_selected_references` ;

CREATE  TABLE IF NOT EXISTS `vigun_selected_references` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `selected_references` TEXT NULL ,
  `vigun_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO vigun_selected_references (`id`, `selected_references`, `vigun_content_id`) VALUES (1, NULL, 1);



DROP TABLE IF EXISTS `phavu_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `phavu_genome_summaries` (
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
  `phavu_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `phavu_resources` ;

CREATE  TABLE IF NOT EXISTS `phavu_resources` (
  `id` INT NOT NULL ,
  `resources` TEXT NULL ,
  `phavu_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `phavu_selected_references` ;

CREATE  TABLE IF NOT EXISTS `phavu_selected_references` (
  `id` INT NOT NULL ,
  `selected_references` TEXT NULL ,
  `phavu_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

INSERT INTO phavu_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `phavu_content_id`) VALUES (1, '<p>Chromosomes (1N): 11.&nbsp;Genome size:&nbsp;587 Mbp (Mercado-Ruaro and Kenton, 1993). Status: sequencing is under-way in 2011 as part of a USDA/NIFA and DOE/Joint Genome Institute effort.</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO phavu_resources (`id`, `resources`, `phavu_content_id`) VALUES (1, '', 1);
INSERT INTO phavu_selected_references (`id`, `selected_references`, `phavu_content_id`) VALUES (1, '<p>Trabelsi D, Mengoni A, Ben Ammar H, Mhamdi R.&nbsp;<a href="http://www.ncbi.nlm.nih.gov/pubmed/21453320">Effect of on-field inoculation of Phaseolus vulgaris with rhizobia on soil bacterial communities</a>, FEMS Microbiol Ecol.&nbsp;2011 Mar 31.</p>', 1);

ALTER TABLE `phavu_contents` 
DROP COLUMN `genome_summary` ,
DROP COLUMN `resources` ,
DROP COLUMN `selected_references` ,
DROP COLUMN `file_name` ,

ADD COLUMN `taxon_id` VARCHAR(255) NULL DEFAULT NULL  AFTER `overview`, 
ADD COLUMN `special_interest` TEXT NULL DEFAULT NULL  AFTER `taxon_id` , 
ADD COLUMN `nodulation_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `special_interest` ,
ADD COLUMN `nodulation_type_information` TEXT NULL DEFAULT NULL  AFTER `nodulation_type` , 
ADD COLUMN `nodulator_species` VARCHAR(255) NULL DEFAULT NULL  AFTER `nodulation_type_information` , 
ADD COLUMN `nodulator_taxon_id` VARCHAR(255) NULL DEFAULT NULL  AFTER `nodulator_species` , 
ADD COLUMN `flowering_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `nodulator_taxon_id` , 
ADD COLUMN `flowering_type_information` TEXT NULL DEFAULT NULL  AFTER `flowering_type` , 
ADD COLUMN `pollination_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `flowering_type_information` , 
ADD COLUMN `pollination_type_information` TEXT NULL DEFAULT NULL  AFTER `pollination_type` , 
ADD COLUMN `self_incompatibility` VARCHAR(255) NULL DEFAULT NULL  AFTER `pollination_type_information` , 
ADD COLUMN `inbreeding` VARCHAR(255) NULL DEFAULT NULL  AFTER `self_incompatibility` ,
ADD COLUMN `wiki_link` VARCHAR(255) NULL DEFAULT NULL  AFTER `inbreeding` ,
ADD COLUMN `legume_id` INT(11) NOT NULL  AFTER `user_id` ;

UPDATE phavu_contents set legume_id = 12 ;