USE `lis_rails` ;

alter table reference_datasets change is_public is_public tinyint(4) DEFAULT NULL;

alter table resources change is_public is_public tinyint(4) DEFAULT NULL;