# clothest-match

# setup
To run this project you will need to have Android Studio, git, Java SDK 17, mysql, maven and an editor of your choice ie. VsCode, intelliJ

- After installing these, clone the repository
```console
$ git clone https://github.com/nugentcaillin/clothest-match.git
```
- To start the backend, first we need to have an appropriate user and database, run mysql and create a database and user with appropriate permissions
```console
$ sudo mysql
mysql> CREATE USER 'catalyst'@'localhost' IDENTIFIED BY 'password'; 
mysql> CREATE DATABASE catalystDB;
mysql> GRANT ALL PRIVILEGES ON catalystDB.* TO 'catalyst'@'localhost';
```
- Next, we need to set the following environment variables so the bakcend can connect to the database: CLOTHEST_MATCH_DB_URL, CLOTHEST_MATCH_DB_USER, CLOTHEST_MATCH_DB_PASS

eg. for linux
```console
$ export CLOTHEST_MATCH_DB_URL=jdbc:mysql://localhost:3306/catalystDB
$ export CLOTHEST_MATCH_DB_USER=catalyst
$ export CLOTHEST_MATCH_DB_PASS=password
```
for windows open advanced system settings > advanced > environment variables
- install dependencies with maven
```console
$ mvn install
```
- next, run the app by running the following command
```console
$ mvn spring-boot:run -Dspring-boot.run.profiles=dev 
```
- finally, verify database is working by visiting http://localhost:8080/hello

If database is working, you will see the message Database Working on the screen