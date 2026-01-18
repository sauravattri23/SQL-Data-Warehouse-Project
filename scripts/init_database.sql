create catalog if not exists Datawarehouse

create schema if not exists Datawarehouse.bronze
COMMENT 'Raw ingested data';

create schema if not exists Datawarehouse.silver
COMMENT 'Cleaned and standardized data';

create schema if not exists Datawarehouse.gold
COMMENT 'ETL logs and metadata'
