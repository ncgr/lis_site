SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `lis_rails` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

USE `lis_rails` ;

ALTER TABLE `development_activities` ENGINE = InnoDB ;

ALTER TABLE `meetings` ENGINE = InnoDB ;

ALTER TABLE `news_articles` ENGINE = InnoDB ;

ALTER TABLE `lotja_contents` 
ADD COLUMN `season` VARCHAR(255) NULL DEFAULT NULL  AFTER `overview` , 
ADD COLUMN `economic_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `season` , 
ADD COLUMN `economic_importance` TEXT NULL DEFAULT NULL  AFTER `economic_type` , 
ADD COLUMN `scientific_importance` TEXT NULL DEFAULT NULL  AFTER `economic_importance` , 
ADD COLUMN `origin_lat` VARCHAR(255) NULL DEFAULT NULL  AFTER `scientific_importance` , 
ADD COLUMN `origin_long` VARCHAR(255) NULL DEFAULT NULL  AFTER `origin_lat` , 
ADD COLUMN `nodulation_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `origin_long` ,
ADD COLUMN `nodulation_information` TEXT NULL DEFAULT NULL  AFTER `nodulation_type` , 
ADD COLUMN `nodulator_species` VARCHAR(255) NULL DEFAULT NULL  AFTER `nodulation_information` , 
ADD COLUMN `nodulator_taxon_id` VARCHAR(255) NULL DEFAULT NULL  AFTER `nodulator_species` , 
ADD COLUMN `flowering_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `nodulator_taxon_id` , 
ADD COLUMN `flowering_information` TEXT NULL DEFAULT NULL  AFTER `flowering_type` , 
ADD COLUMN `pollination_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `flowering_information` , 
ADD COLUMN `pollination_information` TEXT NULL DEFAULT NULL  AFTER `pollination_type` , 
ADD COLUMN `self_incompatibility` VARCHAR(255) NULL DEFAULT NULL  AFTER `pollination_information` , 
ADD COLUMN `inbreeding` VARCHAR(255) NULL DEFAULT NULL  AFTER `self_incompatibility` , 
ADD COLUMN `wiki_link` VARCHAR(255) NULL DEFAULT NULL  AFTER `inbreeding` , 
ADD COLUMN `chromosomes` VARCHAR(255) NULL DEFAULT NULL  AFTER `genome_summary` , 
ADD COLUMN `genome_size` VARCHAR(255) NULL DEFAULT NULL  AFTER `chromosomes` , 
ADD COLUMN `ploidy` VARCHAR(255) NULL DEFAULT NULL  AFTER `genome_size` , 
ADD COLUMN `ploidy_type` VARCHAR(255) NULL DEFAULT NULL  AFTER `ploidy` , 
ADD COLUMN `gc_content_genome` VARCHAR(255) NULL DEFAULT NULL  AFTER `ploidy_type` , 
ADD COLUMN `gc_content_transcriptome` VARCHAR(255) NULL DEFAULT NULL  AFTER `gc_content_genome` , 
ADD COLUMN `chloroplast_genome_size` VARCHAR(255) NULL DEFAULT NULL  AFTER `gc_content_transcriptome` , 
ADD COLUMN `chloroplast_accession_number` VARCHAR(255) NULL DEFAULT NULL  AFTER `chloroplast_genome_size` , 
ADD COLUMN `mitochondria_genome_size` VARCHAR(255) NULL DEFAULT NULL  AFTER `chloroplast_accession_number` , 
ADD COLUMN `mitochondria_accession_number` VARCHAR(255) NULL DEFAULT NULL  AFTER `mitochondria_genome_size` , 
ADD COLUMN `legume_id` INT(11) NOT NULL  AFTER `user_id` ;

LOCK TABLES `lotja_contents` WRITE;
/*!40000 ALTER TABLE `lotja_contents` DISABLE KEYS */;
UPDATE lotja_contents set legume_id = 6 ;
/*!40000 ALTER TABLE `lotja_contents` ENABLE KEYS */;
UNLOCK TABLES;
	
DROP TABLE IF EXISTS `legumes` ;
CREATE  TABLE IF NOT EXISTS `legumes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NOT NULL ,
  `short_name` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  UNIQUE INDEX `short_name_UNIQUE` (`short_name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;

LOCK TABLES `legumes` WRITE;
/*!40000 ALTER TABLE `legumes` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `legumes` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `pathogens` ;
CREATE  TABLE IF NOT EXISTS `pathogens` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `legume_id` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `ncbi_taxon_id` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

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

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'about','<h1>\r\n	About the Legume Information System</h1>\r\n<p>\r\n	The mission of LIS is to enable productive applied and basic research in the legumes by relating data from multiple crop and model species, and by helping researchers traverse among various data types. We would like to get your questions, suggestions, and contributions! <a href=\"mailto:lis_feedback@ncgr.org?subject=LIS%20Site%20Feedback\">lis_feedback@ncgr.org</a></p>\r\n<p>\r\n	The Legume Information System, a component of the Model Plant Initiative (MPI), is developed by the National Center for Genome Resources in cooperation with the USDA Agricultural Research Service under a Specific Cooperative Agreement.</p>\r\n<h3>\r\n	The LIS team</h3>\r\n<p>\r\n	<span class=\"title\">National Center for Genome Resources</span></p>\r\n<p>\r\n	John A. Crow, Andrew D. Farmer, Kenneth A. Seal, Arvind K. Bharti, Selene M. Virk, Gregory D. May</p>\r\n<p>\r\n	<span class=\"title\">United States Department of Agriculture, Agricultural Research Service</span></p>\r\n<p>\r\n	Steven B. Cannon, Nathan T. Weeks, Rex T. Nelson, David M. Grant, Randy C. Shoemaker</p>\r\n','2011-05-12 17:20:06',1),(2,'collaborators','<h1>Collaborators</h1>\r\n\r\n<p><a href=\"http://agbio.usask.ca/index.php?mact=StaffListing,cntnt01,detail,1&cntnt01entry_id=97&cntnt01returnid=2697&page=2697\" target=\"_blank\">Kirstin Bett</a> \r\n(University of Saskatchewan). Development of lentil COS markers and transcriptome \r\nvariant mining of 454-derived sequence data. University of Saskatchewan-funded.</p>\r\n\r\n<p><a href=\"http://www.syngentabiotech.com/biomain.aspx\" target=\"_blank\">Joseph Clarke</a> \r\n(Syngenta). Analysis of soybean population level genetic diversity and the development \r\nof sequence-based bulk segregant analysis. Syngenta-funded.</p>\r\n\r\n<p><a href=\"http://medicago.ucdavis.edu/Personnel/cook/main.html\" target=\"_blank\">Doug Cook</a> \r\n(UC Davis). BAC-end and resistance gene-homologue sequence, and cross-species orthologous \r\nmolecular markers for chickpea, cowpea and pigeon pea. Analyses of ancesteral legume genome structure \r\nand content via synteny analysis of COS maps and model legume genomes. NSF-funded project.</p>\r\n\r\n<p><a href=\"http://bldg6.arsusda.gov/cregan/cregan.html\" target=\"_blank\">Perry Cregan</a> \r\n(USDA, ARS, Beltsville). Pipelining and analysis of Illumina sequence data for SNP discovery \r\nin soybean. An ARS-funded project.</p>\r\n\r\n<p><a href=\"http://www.pioneer.com/web/site/portal/menuitem.7ac46993d5a4a1f7bc0c0a03d10093a0/\" target=\"_blank\">Stephane Deschamps</a> \r\n(DuPont/Pioneer). Analysis of methylation-based genome subsampling in soybean. Pioneer-funded.</p>\r\n\r\n<p><a href=\"http://www.plantbio.cornell.edu/cals/plbio/directory/faculty.cfm?netId=jjd5\" target=\"_blank\">Jeff Doyle</a> \r\n(Cornell University). Transcriptome data generation, pipelining and analysis of diploid soybean progenitor species.</p>\r\n\r\n<p><a href=\"http://www.iplantcollaborative.org/computational-morphodynamics-plants/2009/10/06/compmorph-damian-gessler\" target=\"_blank\">Damian Gessler</a> \r\n(University of Arizona, iPlant Collaborative). We have implementing SSWAP (<a href=\"http://sswap.info\" target=\"_blank\">http://sswap.info</a>) \r\nsemantic web services for LIS. This is the second phase of a two-stage development plan. In the first phase, \r\nwe implemented over a dozen services as part of proof-of-concept work for the Legume Information Network (LIN). \r\nIn our current work, we are collaborating with researchers at Iowa State University\'s Soybase to deploy services \r\nthat will allow Soybase to programmatically access LIS sequence data. By using SSWAP, these services tag data \r\nusing publicly accessible ontologies. They are immediately discoverable at sswap.info, and can be invoked by our \r\nother collaborators such as Gramene. Perhaps most importantly, by using SSWAP\'s OWL DL standard, these services \r\nrender themselves amenable to machine reasoning, thereby furthering our goal of building \"smart\" web resources \r\nthat computers can query to assess suitability-for-purpose based on the semantic content of the data.</p>\r\n\r\n<p><a href=\"http://genome.purdue.edu/jackson_bio/\" target=\"_blank\">Scott Jackson</a>\r\n(Purdue University). Storage and display of BAC-end sequence and physical map data for Phaseolus. \r\nAnalyses of soybean homoeologs and methylated DNA. NRI-funded project.</p>\r\n\r\n<p><a href=\"http://www.cropsoil.uga.edu/personnel/faculty/knapp.html\" target=\"_blank\">Steve Knapp</a> \r\n(University of Georgia). Pipelining, analyses, and display of peanut EST, 454 and Illumina \r\nsequence data. NRI-funded project. Development of peanut COS markers and archiving and acquisition of complete \r\nKnapp data sets into LIS.</p>\r\n\r\n<p><a href=\"http://ibc.wsu.edu/research/lewis/index.htm\" target=\"_blank\">Norman Lewis</a> \r\n(Washington State University). Gene expression and EST sequence assembly in Acacia species. \r\nNIH-funded project.</p>\r\n\r\n<p><a href=\"http://plantsci.missouri.edu/faculty/nguyen.htm\" target=\"_blank\">Henry Nguyen</a> \r\n(University of Missouri). Analysis of soybean small RNAs. University of Missouri-funded.</p>\r\n\r\n<p><a href=\"http://www.jgi.doe.gov/\" target=\"_blank\">Jeremy Schmutz</a> (Stanford), \r\n<a href=\"http://genome.purdue.edu/jackson_bio/\" target=\"_blank\">Scott Jackson</a> (Purdue), \r\n<a href=\"http://www.jgi.doe.gov/research/rokhsar.html\" target=\"_blank\">Dan Rokhsar</a> (DOE-JGI). Data management and analysis of the \r\nDOE-JGI Soybean Genome and NSF SoyMap (Jackson) projects. DOE and NSF-funded projects.</p>\r\n\r\n<p><a href=\"http://apps.carleton.edu/people/ssinger/\" target=\"_blank\">Susan Singer</a> (Carleton College), \r\n<a href=\"http://www.plantbio.cornell.edu/cals/plbio/directory/faculty.cfm?netId=jjd5\" target=\"_blank\">Jeff Doyle</a> (Cornell University), \r\n<a href=\"http://www.ars.usda.gov/pandp/people/people.htm?personid=39095\" target=\"_blank\">Steven Cannon</a> (USDA-ARS). Data generation, \r\nanalysis and display of the nodal legume species Chamaecrista. A NSF-funded project.</p>\r\n\r\n<p><a href=\"http://biochem.missouri.edu/faculty/faculty-members/staceyg/index.php\" target=\"_blank\">Gary Stacey</a> \r\n(University of Missouri). Root hair and gene expression Atlas University of Missouri-funded.</p>\r\n\r\n<p><a href=\"http://www.noble.org/PlantBio/Udvardi/index.html\" target=\"_blank\">Michael Udvardi</a> \r\n(Noble Foundation). Software development and inclusion in SSWAP to incorporate the Medicago \r\nGene Expression Atlas. Establishment of links between LIS and Noble Medicago databases. Medicago transcriptome \r\nsequencing data generation (Illumina) for expression profiling and annotation of the Medicago genome. \r\nA Noble Foundation-funded project.</p>\r\n\r\n<p><a href=\"http://agronomy.cfans.umn.edu/Vance_Carroll_P_USDA-ARS_Ph_D.html\" target=\"_blank\">Carroll Vance</a> (University of Minnesota), \r\n<a href=\"http://www.ars.usda.gov/pandp/people/people.htm?personid=5133\" target=\"_blank\">Randy Shoemaker</a> (Iowa State University). \r\nEvaluated high-throughput sequencing methods (Illumina) to generate agronomically relevant data in soybean. An ARS-funded project.</p>\r\n\r\n<p><a href=\"http://www.gl-ttp.com/news_events/first_gl_ttp_workshop/bio_abstracts/rajeev_varshney\" target=\"_blank\">Rajeev Varshney</a> \r\n(ICRISAT). Data generation, analysis and display of chickpea pigeon pea, development of SNP \r\nmarkers based on the results of 454 and Illumina DNA sequencing. Hosting, for broad community access, pigeon pea \r\ngenome data (60gbytes) - ~60X coverage of Illumina data provided by D. McCombie (Cold Spring Harbor Laboratories). \r\nGCP-funded projects.</p>\r\n\r\n<p><a href=\"http://plpa.cfans.umn.edu/Nevin_D_Young.html\" target=\"_blank\">Nevin Young</a> \r\n(University of Minnesota). Storage, display and analysis of Medicago genome. This includes the \r\nanalysis of Illumina sequence data for genome assembly and SNP identification. NSF-funded project.</p>\r\n\r\n<h1>Publications</h1>\r\n\r\n<p>Schmutz, J., S.B. Cannon, J. Schlueter, J. Ma, D. Hyten, Q. Song, T. Mitros, W. Nelson, G.D. May, N. Gill, \r\nM. Peto, D. Goodstein, J.J. Thelen, J. Cheng, T. Sakurai, T. Umezawa, J. Du, M. Bhattacharyya, D. Sandhu, \r\nD. Grant, T. Joshi, M. Libault, X-C. Zhang, D. Xu, M. Futrell-Griggs, B. Abernathy, U. Hellsten K. Berry, J. Grimwood, \r\nR.A. Wing, P. Cregan, G. Stacey, J. Specht, D. Rokhsar, R.C. Shoemaker, S.A. Jackson. (2010) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/20075913\" target=\"_blank\">Genome sequence of the paleopolyploid soybean (Glycine max (L.) Merr.)</a>. \r\nNature 463:178-183.</p>\r\n\r\n<p>Hyten D.L., Cannon S.B., Song Q., Weeks N., Fickus E.W., Shoemaker R.C., Spect J.E., Farmer A.D., May G.D. and Cregan P.B. (2010) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/20078886\" target=\"_blank\">High-throughput SNP discovery through deep resequencing of a reduced representation library to anchor and orient scaffolds \r\nin the soybean whole genome sequence</a>. \r\nBMC Genomics 11(1):38.</p>\r\n\r\n<p>Libault M., Farmer A., Brechenmacher L., Franck W.L., Drnevich J., Langley R.J., Bilgin D.D., Radman O., Clough S.J., \r\nMay G. and Stacey G. (2010) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/19933387\" target=\"_blank\">Complete transcriptome of the soybean root hair cell, a single cell model, and its alteration in response to \r\nBradyrhizobium japonicum infection</a>. \r\nPlant Physiology 152(2):541-52.</p>\r\n\r\n<p>Joshi T., Yan Z., Libault M., Findley S., Sherrier J., Farmer A., May G., Meyers B., Xu D. and Stacey G. (2010) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/20122185\" target=\"_blank\">Prediction of novel miRNAs and associated target genes in Glycine max</a>. \r\nBMC Bioinformatics 11:S14.</p>\r\n\r\n<p>Bolon Y.-T., Joseph B., Cannon S., Graham M., Diers B., Farmer A., May G.D., Muehlbauer G., Specht J., \r\nTu Z.J., Weeks N., Xu W., Shoemaker R. and Vance C. (2010) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/20199683\" target=\"_blank\">Complementary genetic and genomic approaches help characterize the linkage group I seed protein QTL in soybean</a>. \r\nBMC Plant Biology 10:41-64.</p>\r\n\r\n<p>Nelson R.T., Avraham S., Shoemaker R.C., May G.D., Ware D. and Gessler D.D.G. (2010) \r\nApplications and methods utilizing the Simple Semantic Web Architecture and Protocol (SSWAP) for \r\nbioinformatics resource discovery and disparate data and service integration. \r\nBioData Mining (In Press).</p>\r\n\r\n<p>Deschamps S., la Rota M., Ratashak J., Biddle P., Thureen D., Farmer A., Luck S., Beatty M., \r\nNagasawa N., Michael L., Llaca V., Sakai, H., May G., Lightner J. and Campbell M.A. (2010) \r\nRapid genome-wide SNP discovery in soybean and rice using the Illumina Genome Analyzer. \r\nThe Plant Genome (In Press).</p>\r\n\r\n<p>Varshney R.K., Nayak SN, May G.D. and Jackson S.A. (2009) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/19679362\" target=\"_blank\">Next-generation sequencing technologies and their implications for crop genetics and breeding</a>. \r\nTrends in Biotechnology 27:9:522-530.</p>\r\n\r\n<p>Singer S.R., Maki S.L., Farmer A.D., Ilut D., May G.D., Cannon S.B and Doyle J.J. (2009) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/19755538\" target=\"_blank\">Venturing beyond beans and peas: What can we learn from Chamaecrista</a>? \r\nPlant Physiology 151:1-7.</p>\r\n\r\n<p>Varshney R.K., Penmetsa R.V., Dutta S., Kulwal P.L., Saxena R.K., Datta S., Sharma T.R., Rosen B., N. \r\nCarrasquilla-Garcia N., Farmer A.D., Dubey A., Saxena K.B., J. Gao J., Fakrudin B., Singh M.N., Singh B.P., \r\nWanjari K.B., Yuan M., Srivastava R.K., Kilian A., Upadhyaya H.D., Mallikarjuna N., Town C.D., Bruening G.E., \r\nHe G., May G.D., McCombie R., S. A. Jackson S.A., Singh N.K. and Cook D.R. (2009) \r\n<a href=\"http://www.springerlink.com/content/d07448767867186g/\" target=\"_blank\">Pigeonpea genomics initiative (PGI): An international effort to improve crop productivity of pigeonpea (Cajanus cajan L.)</a>. \r\nMol Breeding DOI 10.1007/s11032-009-9327-2.</p>\r\n\r\n<p>Varshney R.K., Thudi M., May G.D. and Jackson S.A. (2009) \r\n<a href=\"http://www.wiley-vch.de/publish/en/books/ISBN978-0-470-52585-2\" target=\"_blank\">Legume Genomics and Breeding</a>. \r\nPlant Breeding Reviews 33:257-304.</p>\r\n\r\n<p>Gessler D.D.G., Schiltz G.S., May G.D., Avraham S., Town C.D., Grant D. and Nelson R.T. \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/19775460\" target=\"_blank\">SSWAP: A Simple Semantic Web Architecture and Protocol for semantic web services</a>. \r\nBMC Bioinformatics 2009, 10:309-329.</p>\r\n\r\n<p>Cannon S.B., May G.D. and Jackson, S.A. (2009) \r\n<a href=\"http://www.ncbi.nlm.nih.gov/pubmed/19759344\" target=\"_blank\">Three Sequenced Legume Genomes and Many Crop Species: Rich Opportunities for Translational Genomics</a>. \r\nPlant Physiol. 151(3):970-977.</p>','2011-05-12 17:38:25',1),(3,'links','<h1>General information about legumes</h1>\r\n\r\n<h4>Beans</h4>\r\n<p><a href=\"http://en.wikipedia.org/wiki/Bean\" target=\"_blank\">Bean</a> article at Wikipedia. Includes a list of food legumes: approximately eighteen genera and twenty-eight species. \r\nAlso sections on toxins, production, cultural aspects.</p>\r\n\r\n<h4>Legumes</h4>\r\n<p><a href=\"http://en.wikipedia.org/wiki/Legume\" target=\"_blank\">Legume</a> article at Wikipedia. Brief nontechnical overview of the legume family and some characteristics and uses.</p>\r\n\r\n<h4>Rhizobia</h4>\r\n<p><a href=\"http://en.wikipedia.org/wiki/Rhizobia\" target=\"_blank\">Rhizobia</a> article at Wikipedia.</p>\r\n\r\n<p><a href=\"http://bldg6.arsusda.gov/pberkum/Public/collection/index.htm\" target=\"_blank\">Rhizobium germplasm</a> (USDA ARS). USDA ARS National Rhizobium Germplasm Collection.</p>\r\n\r\n<h4>Pulses</h4>\r\n<p><a href=\"http://en.wikipedia.org/wiki/Pulse_(legume)\" target=\"_blank\">Pulses</a> article at Wikipedia. \r\nIncludes the <a href=\"http://en.wikipedia.org/wiki/Food_and_Agriculture_Organization_of_the_United_Nations\" target=\"_blank\">Food and Agriculture Organization\'s</a> (FAO) classification \r\nof eleven primary pulse types and approximately twenty-six species within those types.</p>\r\n\r\n<h4>Legume diseases</h4>\r\n<p><a href=\"http://en.wikipedia.org/wiki/List_of_common_bean_diseases\" target=\"_blank\">List of common bean diseases</a>, article at Wikipedia.</p>\r\n\r\n<h1>Legume species</h1>\r\n\r\n<h4>Adzuki bean Vigna angularis</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3914\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Azuki_bean\" target=\"_blank\">Azuki bean</a> article at Wikipedia.</p>\r\n\r\n<h4>Alfalfa Medicago sativa</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3879\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<h4>Barrel medic Medicago truncatula</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3880\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<h4>Broad bean Vicia faba</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3906\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Broad_bean\" target=\"_blank\">Broad bean</a> article at Wikipedia.</p>\r\n\r\n<h4>Chickpea Cicer arietinum</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3827)\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Chickpea\" target=\"_blank\">Chickpea</a> article at Wikipedia.</p>\r\n\r\n<h4>Common bean Phaseolus vulgaris</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3885\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Common_bean\" target=\"_blank\">Common bean</a> article at Wikipedia. Describes broad classes of beans, antinutritional factors, and numerous \r\nvarieties of green (shell) and dry beans.</p>\r\n\r\n<h4>Lentil Lens culinaris</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3864\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Lentil\" target=\"_blank\">Lentil</a> article at Wikipedia.</p>\r\n\r\n<h4>Lotus japonicus</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=34305\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<h4>Lupin Lupinus</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3869\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Lupin\" target=\"_blank\">Lupin</a> article at Wikipedia.</p>\r\n\r\n<p><a href=\"http://lupin-fin.blogspot.com/\" target=\"_blank\">Lupins as a potential crop in Finland</a></p>\r\n\r\n<p><a href=\"http://lupindiversity.blogspot.com/\" target=\"_blank\">Lupin diversity</a></p>\r\n\r\n<p><a href=\"http://personal.inet.fi/tiede/lupin/\" target=\"_blank\">Online book: Lupins (Geography, classification, genetic resources and breeding)</a></p>\r\n\r\n<p><a href=\"http://www.lupins.org/\" target=\"_blank\">lupins.org</a>. Information portal for lupins, specializing in production in Australia.</p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Lupinus_mutabilis\" target=\"_blank\">Lupinus mutabilis</a> article at Wikipedia.</p>\r\n\r\n<h4>Mung bean Vigna radiata</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3916\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Mung_bean\" target=\"_blank\">Mung bean</a> article at Wikipedia.</p>\r\n\r\n<h4>Peanut Arachis hypogaea</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3818\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Peanut\" target=\"_blank\">Peanut</a> Peanut article at Wikipedia.</p>\r\n\r\n<h4>Soybean Glycine max</h4>\r\n<p><a href=\"http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?mode=Info&id=3847\" target=\"_blank\">NCBI taxonomy</a></p>\r\n\r\n<p><a href=\"http://en.wikipedia.org/wiki/Soybean\" target=\"_blank\">Soybean</a> article at Wikipedia.</p>\r\n\r\n<h1>Sequencing the reference legumes: projects, data, databases</h1>\r\n\r\n<h4>General and clade-based</h4>\r\n<p><a href=\"/\">Legume Information System</a></p>\r\n\r\n<p><a href=\"http://www.legoo.org/\" target=\"_blank\">Legoo</a></p>\r\n\r\n<p><a href=\"http://beangenes.cws.ndsu.nodak.edu/genes/genes.htm\" target=\"_blank\">Bean gene symbols at BeanGenes (NODAK)</a>. Characterized loci.</p>\r\n\r\n<p><a href=\"http://www.eugrainlegumes.org/\" target=\"_blank\">Grain Legumes Integrated Project</a></p>\r\n\r\n<p><a href=\"http://www.ildis.org/\" target=\"_blank\">International Legume Database &amp; Information Service</a></p>\r\n\r\n<p><a href=\"http://www.grainlegumes.com/\" target=\"_blank\">http://grainlegumes.com</a>. European Union grain legumes research portal.</p>\r\n\r\n<h4>Glycine max</h4>\r\n<p><a href=\"http://soybase.org/\" target=\"_blank\">SoyBase</a></p>\r\n\r\n<h4>Lotus japonicus</h4>\r\n<p><a href=\"http://www.kazusa.or.jp/lotus/\" target=\"_blank\">Lotus japonicus genome Kazusa</a> DNA Research Institute</p>\r\n\r\n<h4>Medicago truncatula</h4>\r\n<p><a href=\"http://medicago.org/genome/\" target=\"_blank\">Medicago genome sequencing project</a></p>\r\n\r\n<p><a href=\"http://jcvi.org/cgi-bin/medicago/index.cgi\" target=\"_blank\">Medicago annotation project JCVI</a></p>\r\n\r\n<p><a href=\"http://lily.cebitec.uni-bielefeld.de/truncatulix/app\" target=\"_blank\">Truncatulix Bielefeld</a>, Germany. A research platform for Medicago truncatula expression data.</p>\r\n\r\n<p><a href=\"http://mtgea.noble.org/v2/\" target=\"_blank\">Medicago truncatula Gene Expression Atlas</a> Noble Foundation</p>\r\n\r\n<p><a href=\"http://medicago.toulouse.inra.fr/Mt/EST/\" target=\"_blank\">MENS European Medicago EST Navigation System</a>MENS European Medicago EST Navigation System Toulouse</p>\r\n\r\n<p><a href=\"http://medicago.vbi.vt.edu/\" target=\"_blank\">Medicago functional genomics</a> VBI</p>\r\n\r\n<p><a href=\"http://revgenuk.jic.ac.uk/\" target=\"_blank\">Medicago TILLING</a> Reverse Genetics UK</p>\r\n\r\n<p><a href=\"http://www.medicago.org/GeneChip/\" target=\"_blank\">Medicago Affymetrix GeneChip Annotations</a> USDA-ARS/Minnesota</p>\r\n\r\n<p><a href=\"http://www.noble.org/medicago/\" target=\"_blank\">Medicago functional genomics</a> Noble Foundation</p>\r\n\r\n<p><a href=\"http://www.noble.org/MedicagoHandbook/\" target=\"_blank\">Medicago truncatula Handbook</a> Noble Foundation</p>\r\n\r\n<p><a href=\"https://mtrnai.msi.umn.edu/\" target=\"_blank\">Medicago RNAi Database</a> University of Minnesota</p>\r\n\r\n<h4>Phaseolus vulgaris</h4>\r\n<p><a href=\"http://phaseolusgenes.bioinformatics.ucdavis.edu/search/\" target=\"_blank\">Bean Breeder\'s Molecular Marker Toolbox</a> at UC Davis</p>\r\n\r\n<h1>Culinary</h1>\r\n<p><a href=\"http://www.legumechef.com/\" target=\"_blank\">Legume Chef</a>. Interviews with chefs who use legumes; \r\nbean production in the US.</p>\r\n\r\n<p>Article on <a href=\"http://en.wikipedia.org/wiki/Dal\" target=\"_blank\">dal</a> at Wikipedia.</p>\r\n\r\n<h1>Miscellaneous</h1>\r\n<p><a href=\"http://www.ars-grin.gov/npgs\" target=\"_blank\">National Plant Germplasm System / Germplasm Resources Information Network</a></p>\r\n\r\n<p><a href=\"http://www.generationcp.org/gcptli/?da=0787407\" target=\"_blank\">Generation Challenge Program (Tropical Legumes I)</a>. Generation Challenge Program</p>\r\n\r\n<p><a href=\"http://www.tropicallegumes.org/\" target=\"_blank\">Tropical Legumes Project</a></p>\r\n\r\n<p><a href=\"http://www.icrisat.org/tropicallegumesII/\" target=\"_blank\">Tropical Legumes-II</a></p>\r\n\r\n<p><a href=\"http://www.tropicalforages.info/key/Forages/Media/Html/\" target=\"_blank\">Tropical forages</a> CIAT, FAO, others</p>\r\n\r\n<p><a href=\"http://www.tropicalforages.info/\" target=\"_blank\">Tropical forages: interactive selection tool</a> CIAT, FAO, others</p>\r\n\r\n<p><a href=\"http://www.mobot.org/MOBOT/Research/APweb/orders/fabalesweb.htm\" target=\"_blank\">Missouri Botanical Garden</a>: Fabales taxonomy Missouri Botanical Garden</p>\r\n\r\n<p><a href=\"http://www.palaeos.org/Fabales\" target=\"_blank\">Palaeos Fabales Palaeos.org</a></p>\r\n\r\n<p><a href=\"http://www.kew.org/science/directory/projects/LegumesOfWorldOnline.html\" target=\"_blank\">Legumes of the World Online project Kew</a></p>\r\n\r\n<p><a href=\"http://gisweb.ciat.cgiar.org/GapAnalysis/?cat=5\" target=\"_blank\">Genepool and gap analysis</a>. Detailed analysis of potential collection gaps for thirteen crop gene pools \r\nincluding Cajanus, Cicer, Lens, Phaseolus, Vigna, and Vicia.</p>\r\n\r\n<p><a href=\"http://cals.arizona.edu/desertlegumeprogram/\" target=\"_blank\">Desert legume program</a> University of Arizona</p>\r\n\r\n<p><a href=\"http://www.phytozome.net/\" target=\"_blank\">Phytozome</a> Green plant comparative genomics.</p>\r\n\r\n<p><a href=\"http://www.tropicos.org/Project/IPCN\" target=\"_blank\">Index to plant chromosome numbers</a></p>\r\n\r\n<p><a href=\"http://www.unitedsoybean.org/default.aspx\" target=\"_blank\">United Soybean Board</a></p>\r\n\r\n<p><a href=\"http://www.nsrl.uiuc.edu/\" target=\"_blank\">National Soybean Research Laboratory</a> (NSRL)</p>\r\n\r\n<p><a href=\"http://www.nap.edu/openbook.php?isbn=030904264X\" target=\"_blank\">Lost Crops of the Incas</a> (online book) NAP</p>\r\n\r\n<p><a href=\"http://www.nass.usda.gov/\" target=\"_blank\">USDA National Agricultural Statistics Service</a> USDA</p>','2011-05-12 17:51:46',1),(4,'participating_groups','<h1>\r\n	Overview</h1>\r\n<p>\r\n	The Legume Information System is one component in a global network of data providers in support of legume bioinformatic research. A key objective of LIS is to help bring diverse data sets together in useful ways. The data repositories and tools below are important contributions to this network. Please contact us at <a href=\"mailto:lis_feedback@ncgr.org?subject=LIS Site Feedback\">lis_feedback@ncgr.org</a> if you have a resource that should be listed here.</p>\r\n<p>\r\n	<strong>Broad bioinformatic resources or tools</strong><br />\r\n	&nbsp;&nbsp;<a href=\"http://www.phytozome.net/\" target=\"_blank\">Phytozome at JGI</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://www.symapdb.org/\" target=\"_blank\">Synteny Mapping and Analysis Program at U AZ</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://www.legoo.org/\" target=\"_blank\">Legume bioinformatics at INRA</a><br />\r\n	<strong>Soybean resources</strong><br />\r\n	&nbsp;&nbsp;<a href=\"http://soybase.org/\" target=\"_blank\">SoyBase at ISU (USDA-ARS)</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://www.phytozome.net/soybean.php\" target=\"_blank\">Phytozome soybean portal</a><br />\r\n	&nbsp;&nbsp;(also see<a href=\"http://glyma.comparative-legumes.org\" target=\"_blank\">Glycine max</a>)<br />\r\n	<strong>Medicago resources</strong><br />\r\n	&nbsp;&nbsp;<a href=\"http://medicagohapmap.org/genome/\" target=\"_blank\">Medicagohapmap.org at UMN</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://jcvi.org/cgi-bin/medicago/index.cgi\" target=\"_blank\">Medicago at JCVI</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://medtr.comparative-legumes.org/gb2/gbrowse/3.5.1/\" target=\"_blank\">Medicago browser at LIS</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://mips.helmholtz-muenchen.de/plant/medi/index.jsp\" target=\"_blank\">The Medicago truncatula project at MIPS</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://www.noble.org/medicago/\" target=\"_blank\">Medicago at Noble Foundation</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://lily.cebitec.uni-bielefeld.de/truncatulix/app\" target=\"_blank\">TRUNCATULIX at Bielefeld DE</a><br />\r\n	&nbsp;&nbsp;<a href=\"http://www1.montpellier.inra.fr/BRC-MTR/accueil.php\" target=\"_blank\">Medicago Biological Resource Center at INRA</a><br />\r\n	&nbsp;&nbsp;(also see <a href=\"http://medtr.comparative-legumes.org\">Medicago truncatula</a>)<br />\r\n	<strong>Lotus resources</strong><br />\r\n	&nbsp;&nbsp;<a href=\"http://www.kazusa.or.jp/lotus/\" target=\"_blank\">The Lotus genome project at Kazusa</a><br />\r\n	&nbsp;&nbsp;(also see <a href=\"http://lotja.comparative-legumes.org\">Lotus japonicus</a>)</p>\r\n','2011-05-12 18:01:06',1),(5,'species','<h2>\r\n	Species Text</h2>\r\n<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ullamcorper orci elit, nec consequat lorem. Morbi at lectus a mi congue consequat ac sit amet orci. Proin pellentesque sapien et neque fermentum euismod. Vivamus in dolor leo, sit amet auctor velit. Phasellus lacus nulla, condimentum sit amet accumsan eget, vulputate laoreet nisi. Donec quis quam at nisl posuere aliquam. Nullam tempus consequat vehicula. Donec ut nisl quam. Nam non gravida quam. Etiam quam odio, rutrum fermentum dignissim et, tristique non metus. Proin nisl neque, molestie non volutpat ac, fermentum in sem.</p>\r\n','2011-05-13 14:59:20',1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;