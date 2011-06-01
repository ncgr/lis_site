USE `lis_rails` ;
 
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `data` text COLLATE utf8_bin,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

ALTER TABLE `lotja_contents` 
DROP COLUMN `economic_type` , 
DROP COLUMN `economic_importance` ,
CHANGE nodulation_information nodulation_type_information TEXT , 
CHANGE flowering_information flowering_type_information TEXT ,
CHANGE pollination_information pollination_type_information TEXT ; 

INSERT INTO `pages` SET id = 6, title = 'welcome', body = '<h4>Welcome</h4><p>The mission of LIS is to facilitate discoveries and crop improvement in the legumes -- critical components of global agriculture. Please send us your questions, suggestions, and contributions!<br /><a href="mailto:lis_feedback@ncgr.org?subject=LIS%20Site%20Feedback">lis_feedback@ncgr.org</a></p>' ;

ALTER TABLE `users`
DROP COLUMN `invitation_token` ,
DROP COLUMN `invitation_sent_at` ,
DROP COLUMN `invitation_limit` ,
DROP COLUMN `invited_by_id` ,
DROP COLUMN `invited_by_type` ;
