USE `lis_rails` ;

ALTER TABLE `lotja_contents` 
DROP COLUMN `season` ;

ALTER TABLE `lotja_genome_summaries`
DROP COLUMN `ploidy` ;
