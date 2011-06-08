USE `lis_rails` ;

ALTER TABLE `lotja_contents`
CHANGE scientific_importance special_interest TEXT ;

DROP TABLE IF EXISTS `lotja_resources` ;

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
