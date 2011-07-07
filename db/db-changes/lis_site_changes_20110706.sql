USE `lis_rails` ;

DROP TABLE IF EXISTS `nodulators` ;

CREATE  TABLE IF NOT EXISTS `nodulators` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `legume_id` VARCHAR(255) NOT NULL ,
  `species` VARCHAR(255) NULL ,
  `ncbi_taxon_id` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

ALTER TABLE arahy_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE cajca_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE chafs_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE cicar_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE glyma_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE lencu_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE lotja_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE lupal_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE lupan_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE medsa_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE medtr_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE pea_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE phacn_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE phavu_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE tripr_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE vicfa_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE vigra_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;

ALTER TABLE vigun_contents 
CHANGE taxon_id ncbi_taxon_id VARCHAR(255) ,
ADD COLUMN grin_taxon_id VARCHAR(255) NULL DEFAULT NULL AFTER ncbi_taxon_id ,
DROP COLUMN nodulator_species ,
DROP COLUMN nodulator_taxon_id ;
