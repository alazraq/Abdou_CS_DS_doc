# PostgresSQL importing data tutorial:

1. On terminal type: 
> psql 
This will launch the psql command line interface for a Postgres client to interact with postgre server

2. Now create a database called dvdrental by issuing (under Abderrahmane=#)
> CREATE DATABASE dvdrental;
This will create a database that you can see in PostgresSQL app

3. load the data (bunch of .dat files + restore.sql files that specifies all the tables, functions, views to create and copying data from .dat files into created tables) into the database:
> pg_restore -U postgres -d dvdrental /Users/Abderrahmane/Desktop/dvdrental

4. verify that data was imported correctly: go to postges app, click on dvdrental database, this will open a command prompt with psql cli dvdrental=#
> SELECT 
>   first_name
> FROM 
>   customer;