USE `lis_rails` ;

DROP TABLE IF EXISTS `lotja_genome_summaries` ;

CREATE  TABLE IF NOT EXISTS `lotja_genome_summaries` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `genome_summary` TEXT NULL ,
  `chromosomes` VARCHAR(255) NULL ,
  `genome_size` VARCHAR(255) NULL ,
  `genome_size_information` TEXT NULL ,
  `ploidy` VARCHAR(255) NULL ,
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

DROP TABLE IF EXISTS `lotja_resources` ;

CREATE  TABLE IF NOT EXISTS `lotja_resources` (
  `id` INT NOT NULL ,
  `resources` TEXT NULL ,
  `lotja_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `lotja_selected_references` ;

CREATE  TABLE IF NOT EXISTS `lotja_selected_references` (
  `id` INT NOT NULL ,
  `selected_references` TEXT NULL ,
  `lotja_content_id` INT NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


INSERT INTO lotja_genome_summaries (`id`, `genome_summary`, `chromosomes`, `genome_size`, `genome_size_information`, `ploidy`, `ploidy_type`, `gc_content_genome`, `gc_content_genome_information`, `gc_content_transcriptome`, `gc_content_transcriptome_information`, `chloroplast_genome_size`, `chloroplast_genome_size_information`, `chloroplast_accession_number`, `mitochondria_genome_size`, `mitochondria_genome_size_information`, `mitochondria_accession_number`, `lotja_content_id`) VALUES (1, '<p>2n=12; 471 Mbp; diploid</p>', '2n = 12', '471', NULL, 'diploid', NULL, NULL, NULL, NULL, NULL, '150.5', NULL, 'NC_002694', NULL, NULL, NULL, 1);
INSERT INTO lotja_resources (`id`, `resources`, `lotja_content_id`) VALUES (1, '<p>(&diams; = of special interest)</p><p><strong>Genome browsers</strong></p><ul style="margin-left: 40px; "><li><a href="http://www.kazusa.or.jp/lotus/">GBrowse at Kazusa (gene-scale focus)</a>&nbsp;&diams;</li><li><a href="http://lotja.comparative-legumes.org/gb2/gbrowse">GBrowse at LIS (comparative focus)</a>&nbsp;&diams;</li></ul><p><strong>Genome assembly and annotations</strong></p><ul style="margin-left: 40px; "><li><a href="ftp://ftp.kazusa.or.jp/pub/lotus/">Current genome assembly (Kazusa ftp site)</a></li></ul><p><strong>Genetic maps</strong></p><ul style="margin-left: 40px; "><li><a href="http://www.kazusa.or.jp/lotus/markerdb_index.html">Kazusa Lotus marker DB</a>&nbsp;&diams;</li><li><a href="http://www.ncbi.nlm.nih.gov/projects/mapview/map_search.cgi?taxid=34305">NCBI Map Viewer</a></li></ul><p><strong>Transcript assemblies</strong></p><ul style="margin-left: 40px; "><li><a href="http://est.kazusa.or.jp/en/plant/lotus/EST/">Kazusa EST index</a></li><li><a href="http://www.ncbi.nlm.nih.gov/UniGene/UGOrg.cgi?TAXID=34305">UniGene build at NCBI</a></li>li><a href="http://compbio.dfci.harvard.edu/tgi/cgi-bin/tgi/gimain.pl?gudb=l_japonicus">Gene Index at DFCI</a></li>li><a href="ftp://ftp.tigr.org/pub/data/plantta/Lotus_japonicus/">Transcript assemblies at JCVI</a></li><li><a href="http://lis.comparative-legumes.org/lis/lis_summary.html?page_type=transcript">Transcript assemblies at LIS Classic</a></li></ul><p><strong>Other genome resources</strong></p><ul style="margin-left: 40px; "><li><a href="http://www.cbs.dtu.dk/cgi-bin/lotus/db.cgi">Proteome database</a></li><li><a href="http://revgenuk.jic.ac.uk/">TILLING project</a></li><li><a href="http://www.kazusa.or.jp/lotus/markerdb_index.html">Marker DB</a></li><li><a href="http://www.shigen.nig.ac.jp/bean/lotusjaponicus/top/top.jsp">Resources at Legume Base</a></li><li><a href="http://www.lotusjaponicus.org/links.htm">Resources at John Innes Centre</a></li><li><a href="http://www.inia.org.uy/sitios/lnl/index.html">Newsletter</a></li><li><a href="http://genome.kazusa.or.jp/rhizobase/">RhizoBase</a></li></ul>', 1);
INSERT INTO lotja_selected_references (`id`, `selected_references`, `lotja_content_id`) VALUES (1, '<p>Current publications on <a href="http://www.ncbi.nlm.nih.gov/pubmed?term=lotus%20japonicus%5BTitle%2FAbstract%5D" target="_blank"><i>Lotus japonicus</i> at PubMed ...</a></p><hr /><p>Fotelli MN, Tsikou D, Kolliopoulou A, Aivalakis G, Katinakis P, Udvardi MK, Rennenberg H, Flemetakis E.&nbsp;<a href="http://www.ncbi.nlm.nih.gov/pubmed/21307384">Nodulation enhances dark CO<sub>2</sub> fixation and recycling in the model legume <i>Lotus japonicus</i></a>.&nbsp;Exp Bot. 2011 May; 62(8):2959-71.</p><p>Sato S, Nakamura Y, Kaneko T, Asamizu E, Kato T, Nakao M, Sasamoto S, Watanabe A, Ono A, Kawashima K, Fujishiro T, Katoh M, Kohara M, Kishida Y, Minami C, Nakayama S, Nakazaki N, Shimizu Y, Shinpo S, Takahashi C, Wada T, Yamada M, Ohmido N, Hayashi M, Fukui K, Baba T, Nakamichi T, Mori H, Tabata S. <a href="http://dnaresearch.oxfordjournals.org/content/15/4/227.short">Genome structure of the legume, <i>Lotus japonicus</i></a>. DNA Res. 2008 Aug;15(4):227-39.</p><p>Wang X, Sato S, Tabata S, Kawasaki S.&nbsp;<a href="http://www.ncbi.nlm.nih.gov/pubmed/18794159">A high-density linkage map of <i>Lotus japonicus</i> based on AFLP and SSR markers</a>.&nbsp;NA Res. 2008 Oct; 15(5):323-32.</p><p>Sato S, Tabata S.&nbsp;<a href="http://www.ncbi.nlm.nih.gov/pubmed/16480917"><i>Lotus japonicus</i> as a platform for legume research</a>.&nbsp;Curr Opin Plant Biol. 2006 Apr; 9(2):128-32.</p><p>Udvardi MK, Tabata S, Parniske M, Stougaard J.<em>&nbsp;</em><a href="http://www.ncbi.nlm.nih.gov/pubmed/15882654"><em>Lotus japonicus</em>: legume research in the fast lane</a>.&nbsp;Trends Plant Sci. 2005 May; 10(5):222-8.</p><p>Young ND, Cannon SB, Sato S, Kim D, Cook DR, Town CD, Roe BA, Tabata S. <a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC1088310/?tool=pmcentrez">Sequencing the genespaces of <em>Medicago truncatula </em>and<em> Lotus japonicus</em></a>.&nbsp;Plant Physiol. 2005 April; 137(4): 1174&ndash;1181.</p><p>Desbrosses GG, Kopka J, Udvarti MK. <a href="http://www.ncbi.nlm.nih.gov/pmc/articles/PMC1088322/"><em>Lotus japonicus </em>metabolic profiling. Development of gas chromatography-mass spectrometry resources for the study of plant-microbe interactions</a>.&nbsp;Plant Physiol. 2005 April; 137(4): 1302&ndash;1318.</p><p>Kouchi H, Shimomura K, Hata S, Hirota A, Wu GJ, Kumagai H, Tajima S, Suganuma N, Suzuki A, Aoki T, Hayashi M, Yokoyama T, Ohyama T, Asamizu E, Kuwata C, Shibata D, Tabata S.&nbsp;<a href="http://www.ncbi.nlm.nih.gov/pubmed/15500251">Large-scale analysis of gene expression profiles during early stages of root nodule formation in a model legume, <i>Lotus japonicus</i></a>.&nbsp;DNA Res. 2004 Aug 31; 11(4):263-74.</p><p>Kato T, Kaneko T, Sato S. Nakamura Y, Tabata S. <a href="http://www.ncbi.nlm.nih.gov/pubmed/11214967">Complete structure of the chloroplast genome of a legume, <i>Lotus japonicus</i></a>. DNA Res. 2000 323-330.</p>', 1);


ALTER TABLE `lotja_contents` 
ADD COLUMN `taxon_id` VARCHAR(255) NULL DEFAULT NULL  AFTER `id`, 
DROP COLUMN `genome_summary` , 
DROP COLUMN `chromosomes` , 
DROP COLUMN `genome_size` , 
DROP COLUMN `ploidy` , 
DROP COLUMN `ploidy_type` , 
DROP COLUMN `gc_content_genome` , 
DROP COLUMN `gc_content_transcriptome` , 
DROP COLUMN `chloroplast_genome_size` , 
DROP COLUMN `chloroplast_accession_number` , 
DROP COLUMN `mitochondria_genome_size` , 
DROP COLUMN `mitochondria_accession_number` , 
DROP COLUMN `resources` , 
DROP COLUMN `selected_references` ;
