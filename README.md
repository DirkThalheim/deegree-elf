# deegree-elf

This repository contains some basic deegree feature store configurations and PostGIS-DB initialization scripts for the ELF-Project.

## Feature Stores

For each INSPIRE Thema a SQLFeatureStore configuration is provided. The configuration is not complete and some optional attributes are omitted.

For better organisation, each theme gets its own schema within the database.

Within the configuration JDBCConnId and StorageCRS may be adjusted.

## SQL Scripts

Initialization scripts for PostGIS are provided. Replace the user group elf_admin to your corresponding DB user group.