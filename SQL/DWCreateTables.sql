CREATE DATABASE ZomatoRestaurantsDW
USE ZomatoRestaurantsDW

DROP TABLE fct_RestaurantFacts
DROP TABLE brg_RestaurantCuisine
DROP TABLE brg_RestaurantHighlight
DROP TABLE dim_Restaurant
DROP TABLE dim_Cuisine
DROP TABLE dim_Highlight
DROP TABLE dim_PriceRange
DROP TABLE dim_Location
DROP TABLE dim_Genre


CREATE TABLE dim_Genre
(
	genreID INT IDENTITY(1,1),
	genreName VARCHAR(20),
	CONSTRAINT pk_dimGenre PRIMARY KEY (genreID)
)

CREATE TABLE dim_PriceRange
(
	priceRangeID INT,
	costForTwo INT,
	CONSTRAINT pk_dimPriceRange PRIMARY KEY (priceRangeID)
)
CREATE TABLE dim_Highlight
(
	highlightID INT IDENTITY(1,1),
	highlightName VARCHAR(30),
	CONSTRAINT pk_dimHighlight PRIMARY KEY (highlightID)
)
CREATE TABLE dim_Cuisine 
(
	cuisineID INT IDENTITY(1,1),
	cuisineName VARCHAR(20),
	CONSTRAINT pk_dimCuisine PRIMARY KEY (cuisineID)
)

CREATE TABLE dim_Location
(
	locationID INT IDENTITY(1,1),
	countryName VARCHAR(20),
	stateName VARCHAR(20),
	cityName VARCHAR(20),
	localityName VARCHAR(70)
	CONSTRAINT pk_dimLocation PRIMARY KEY (locationID)
)

CREATE TABLE dim_Restaurant
(
	restaurantID INT IDENTITY(1,1),
	restaurantName VARCHAR(70),
	restaurantAddress VARCHAR(210),
	CONSTRAINT pk_dimRestaurant PRIMARY KEY (restaurantID)
)
CREATE TABLE brg_RestaurantHighlight
(
	restaurantHighlightID INT IDENTITY(1,1),
	restaurantID INT,
	highlightID INT,
	CONSTRAINT pk_brgRestaurantHighlight PRIMARY KEY (restaurantHighlightID),
	CONSTRAINT fk_brgRestaurantHighlightRestaurant FOREIGN KEY (restaurantID) REFERENCES dim_Restaurant(restaurantID),
	CONSTRAINT fk_brgRestaurantHighlightHighlight FOREIGN KEY (highlightID) REFERENCES dim_Highlight(highlightID)
)
CREATE TABLE brg_RestaurantCuisine
(
	restaurantCuisineID INT IDENTITY(1,1),
	restaurantID INT,
	cuisineID INT,
	CONSTRAINT pk_brgRestaurantCusine PRIMARY KEY (restaurantCuisineID),
	CONSTRAINT fk_brgRestaurantCuisineRestaurant FOREIGN KEY (restaurantID) REFERENCES dim_Restaurant(restaurantID),
	CONSTRAINT fk_brgRestaurantCuisineCuisine FOREIGN KEY (cuisineID) REFERENCES dim_Cuisine(cuisineID)
)
CREATE TABLE fct_RestaurantFacts
(
	factID INT IDENTITY(1,1),
	restaurantID INT, 
	locationID INT,
	genreID INT,
	priceRangeID INT,
	CONSTRAINT pk_fct_RestaurantFacts PRIMARY KEY (factID),
	CONSTRAINT fk_fctRestaurantFactsRestaurant FOREIGN KEY (restaurantID) REFERENCES dim_Restaurant(restaurantID),
	CONSTRAINT fk_fctRestaurantFactLocation FOREIGN KEY (locationID) REFERENCES dim_Location(locationID),
	CONSTRAINT fk_fctRestaurantFactGenre FOREIGN KEY (genreID) REFERENCES dim_Genre(genreID),
	CONSTRAINT fk_fctRestaurantFactPriceRange FOREIGN KEY (priceRangeID) REFERENCES dim_PriceRange(priceRangeID),
	restaurantRating DECIMAL(5,2),
	numberOfPhotos INT,
	numberOfVotes INT
)