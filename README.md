# clothest-match

## about
Tinder for clothes - match users with close they truly like while giving brands valuable insights into improving customer experience.

Clothest match's innovative swiping system allows us to quickly get a picture of a customers clothing preference and track how customers see a product.

Clothes are assigned different categories, and swipes both left and right adjust the weight of characteristics for both users and products. This constant feedback allows us to fine tune our reccomendation algorithm, and get a clear picture of how consumers see products.

## technology
For our frontend, we implement a standalone cross platform application using Flutter.

For the backend, we use Spring boot, spring data JPA, mysql and spring session to make a RESTful API, with the backend containerised and deployed at http://api.clothestmatch.caillin.net with docker. API endpoints can be viewed at the end of this document.

We also make some of these endpoints available for brands to interact with our platform through whatever method they please

Login is handled with session tokens, so users do not even need to log in to use the service if they do not wish to ie. tiktok style login

# deployment instructions
## Backend
To deploy on any server, first ensure you have a local mysql server running following the setup for development guide pull the docker image caillinnugent/clothest-match:latest,
or use the following docker-compose file. Note, the following docker file uses host networking, so if you are also hosting mysql in a docker container, you will need to edit networking accordingly.
```
version: "3"
services:
  clothest-match:
    image: caillinnugent/clothest-match:latest
    network_mode: "host"
    environment:
      CLOTHEST_MATCH_DB_URL: jdbc:mysql://localhost:3306/catalystDB
      CLOTHEST_MATCH_DB_USER: catalyst
      CLOTHEST_MATCH_DB_PASS: password
```
then run with
```console
$ docker-compose up -d
```
now service will be running on port 8080, ready to be mapped to a url with nginx. You can verify this by going to api_location/hello. The screen should now say Database not working

## frontend


# setup for development
To run this project you will need to have Android Studio, git, Java SDK 17, mysql, flutter, maven and an editor of your choice ie. VsCode, intelliJ

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

# API endpoints

### GET /product/{count}
returns up to count products not previously seen by user. 
### POST /product/new_photo_no_tag_values/{name}
create a new product with a photo, name and tags, which will be initialised with weights of 0. Creates session for company if not present
###### example body:
```
{
    "url": "image_url",
    "tags": [
        "Casual",
        "Alternative"
    ]
}
```
### POST /product/new_photo_and_tags/{name}

create a new product with a photo, name and tags with individual starting weights, creates session for company if not present
###### example body:
```
{
    "url": "image_url",
    "tags": [
        {"name": "Casual", "weight": 5.0},
        {"name": "Business", "weight": 4.0},
        {"name": "Sportswear", "weight": -9.0},
        {"name": "Classic", "weight": 2.0}
    ]
}
```
### PUT /product/swipeRight
Marks a product as seen, and adds it to the users gallery. Adjusts the users tag weights, and slightly adjust products tag weights. Accepts product ID in body of request
### PUT /product/swipeLeft
Marks a product as seen, and does not add it to the users gallery. Adjusts the users tag weights and slightly adjusts products tag weights
### GET /product/created
Gets information about products a company has posted for analytics

