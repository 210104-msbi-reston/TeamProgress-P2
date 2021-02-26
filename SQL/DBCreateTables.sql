--CREATE DATABASE
CREATE DATABASE ZomatoRestaurants
USE ZomatoRestaurants


--DROP TABLES
--DROP TABLE tbl_RestaurantHighlights
--DROP TABLE tbl_RestaurantCuisines
--DROP TABLE tbl_Restaurants
--DROP TABLE tbl_Localities
--DROP TABLE tbl_Cities
--DROP TABLE tbl_States
--DROP TABLE tbl_PriceRanges
--DROP TABLE tbl_Highlights
--DROP TABLE tbl_Cuisines
--DROP TABLE tbl_Genres
--DROP TABLE tbl_Countries

--CREATE TABLES
CREATE TABLE tbl_Countries
(
	countryID INT IDENTITY(1,1),
	countryName VARCHAR(20),
	CONSTRAINT pk_Countries PRIMARY KEY(countryID)
)
CREATE TABLE tbl_Genres
(
	genreID INT IDENTITY(1,1),
	genreType VARCHAR(20),
	CONSTRAINT pk_Genres PRIMARY KEY(genreID)
)
CREATE TABLE tbl_Cuisines
(
	cuisineID INT IDENTITY(1,1),
	cuisineType VARCHAR(20),
	CONSTRAINT pk_Cuisines PRIMARY KEY(cuisineID)
)
CREATE TABLE tbl_Highlights
(
	highlightID INT IDENTITY(1,1),
	highlightDescription VARCHAR(30)
	CONSTRAINT pk_Highlights PRIMARY KEY(highlightID)
)
CREATE TABLE tbl_PriceRanges
(
	priceRange INT,
	priceRangeCostForTwo INT,
	CONSTRAINT pk_PriceRanges PRIMARY KEY(priceRange)
)
CREATE TABLE tbl_States
(
	stateID INT IDENTITY(1,1),
	stateName VARCHAR(20),
	countryID INT,
	CONSTRAINT pk_States PRIMARY KEY(stateID),
	CONSTRAINT pk_StateCountry FOREIGN KEY(countryID) REFERENCES tbl_Countries(countryID)
)
CREATE TABLE tbl_Cities
(
	cityID INT IDENTITY(1,1),
	cityName VARCHAR(20),
	stateID INT,
	CONSTRAINT pk_Cities PRIMARY KEY(cityID),
	CONSTRAINT fk_CityState FOREIGN KEY(stateID) REFERENCES tbl_States(stateID)
)
CREATE TABLE tbl_Localities
(
	localityID INT IDENTITY(1,1),
	localityName VARCHAR(70),
	cityID INT,
	CONSTRAINT pk_Localities PRIMARY KEY(localityID),
	CONSTRAINT fk_LocalityCity FOREIGN KEY(cityID) REFERENCES tbl_Cities(cityID)
)
CREATE TABLE tbl_Restaurants
(
	restaurantID INT IDENTITY(1,1),
	restaurantDataID INT,
	restaurantName VARCHAR(70),
	localityID INT,
	restaurantRating DECIMAL(5,2),
	restaurantAddress VARCHAR(210),
	priceRange INT,
	genreID INT,
	restaurantPhotoQty INT,
	restaurantVoteQty INT,
	CONSTRAINT pk_Restaurants PRIMARY KEY(restaurantID),
	CONSTRAINT fk_RestaurantLocality FOREIGN KEY(localityID) REFERENCES tbl_Localities(localityID),
	CONSTRAINT fk_RestaurantPriceRange FOREIGN KEY(priceRange) REFERENCES tbl_PriceRanges(priceRange),
	CONSTRAINT fk_RestaurantGenre FOREIGN KEY(genreID) REFERENCES tbl_Genres(genreID),
)

CREATE TABLE tbl_RestaurantCuisines
(
	restaurantID INT,
	cuisineID INT,
	CONSTRAINT fk_RestaurantCuisineRestaurant FOREIGN KEY(restaurantID) REFERENCES tbl_Restaurants,
	CONSTRAINT fk_RestaurantCuisineCuisine FOREIGN KEY(cuisineID) REFERENCES tbl_Cuisines,
	CONSTRAINT pk_RestaurantCuisines PRIMARY KEY (restaurantID, cuisineID)
)
CREATE TABLE tbl_RestaurantHighlights
(
	restaurantID INT,
	highlightID INT,
	CONSTRAINT fk_RestauranHighlightRestaurant FOREIGN KEY(restaurantID) REFERENCES tbl_Restaurants,
	CONSTRAINT fk_RestaurantHighlightHighlight FOREIGN KEY(highlightID) REFERENCES tbl_Highlights,
	CONSTRAINT pk_RestaurantHighlights PRIMARY KEY (restaurantID, highlightID)
)
--SELECT * FROM tbl_RestaurantHighlights WHERE highlightID = 27

--exec sp_who
--kill 56
--SELECT DISTINCT highlightID FROM tbl_RestaurantHighlights ORDER BY highlightID ASC
--SELECT DISTINCT cuisineID FROM tbl_RestaurantCuisines ORDER BY cuisineID ASC
--TRUNCATE TABLE tbl_RestaurantHighlights

--SELECT Count(*) FROM tbl_RestaurantHighlights