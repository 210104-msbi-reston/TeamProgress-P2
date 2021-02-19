create database Test;
use Test;

-- Create Dimension Tables
create table dimRestaurant(
	restaurantID int primary key identity,
	storeName varchar(50),
	restaurantAddress varchar(50),
	customerRating numeric(5, 1),
	numberOfVotes int,
	numberOfPhotos int
);

create table dimCuisine(
	cuisineID int primary key identity,
	cuisineName varchar(30)
);

create table dimGenre(
	genreID int primary key identity,
	genreName varchar(25)
);

create table dimHighlight(
	highlightID int primary key identity,
	highlightName varchar(50)
);

create table dimLocation(
	locationID int primary key identity,
	countryName varchar(25),
	stateName varchar(25),
	cityName varchar(50)
);

create table dimPriceRange(
	priceRangeID int primary key identity,
	costForTwo int
);

-- Create Bridge Tables
create table brgRestaurantCuisine(
	restaurantCuisineID int primary key identity,
	restaurantID int foreign key references dimRestaurant(restaurantID),
	cuisineID int foreign key references dimCuisine(cuisineID)
);

create table brgRestaurantHighlight(
	restaurantHighlightID int primary key identity,
	restaurantID int foreign key references dimRestaurant(restaurantID),
	highlightID int foreign key references dimHighlight(highlightID)
);

-- Create Fact Table
create table factTable(
	factID int primary key identity,
	restaurantID int foreign key references dimRestaurant(restaurantID),
	locationID int foreign key references dimLocation(locationID),
	genreID int foreign key references dimGenre(genreID),
	priceRangeID int foreign key references dimPriceRange(priceRangeID)
);

-- Insert Statements
-- dimRestaurant Inserts
insert into dimRestaurant values('Domino''s', 'dAddress 1', 3.8, 450, 23);
insert into dimRestaurant values('Domino''s', 'dAddress 2', 1.7, 123, 12);
insert into dimRestaurant values('Domino''s', 'dAddress 3', 4.5, 632, 69);
insert into dimRestaurant values('Subway', 'sAddress 1', 0.7, 897, 9);
insert into dimRestaurant values('Subway', 'sAddress 2', 2.4, 146, 45);
insert into dimRestaurant values('Pizza Hut', 'pAddress 1', 1.9, 245, 36);
insert into dimRestaurant values('Burger King', 'bAddress 1', 4.7, 12, 67);
insert into dimRestaurant values('Burger King', 'bAddress 2', 2.3, 420, 45);
insert into dimRestaurant values('Burger King', 'bAddress 3', 2.2, 57, 78);
insert into dimRestaurant values('Burger King', 'bAddress 4', 4.1, 75, 15);
insert into dimRestaurant values('Starbucks', 'cAddress 1', 2.9, 41, 89);
insert into dimRestaurant values('Starbucks', 'cAddress 2', 0.8, 86, 42);
insert into dimRestaurant values('Starbucks', 'cAddress 3', 1.1, 186, 123);
insert into dimRestaurant values('Starbucks', 'cAddress 4', 0.9, 16, 23);
insert into dimRestaurant values('Starbucks', 'cAddress 5', 1.9, 40, 29);


-- dimCuisine Inserts
insert into dimCuisine values('Pizza');
insert into dimCuisine values('Pasta');
insert into dimCuisine values('Sub');
insert into dimCuisine values('Chips');
insert into dimCuisine values('Burgers');
insert into dimCuisine values('Fries');
insert into dimCuisine values('Chicken');
insert into dimCuisine values('Coffee');


-- dimGenre Inserts
insert into dimGenre values('Fast Food');
insert into dimGenre values('Beverage');
insert into dimGenre values('Dine In');

-- dimHighlight Inserts
insert into dimHighlight values('Delivery');
insert into dimHighlight values('Drive-thru');
insert into dimHighlight values('Open Late');
insert into dimHighlight values('Open Kitchen');
insert into dimHighlight values('Specials');
insert into dimHighlight values('Fountain Drinks');

-- dimLocation Inserts
insert into dimLocation values('United States', 'Alabama', 'Mobile');
insert into dimLocation values('United States', 'Alabama', 'Semmes');
insert into dimLocation values('United States', 'Alabama', 'Spanish Fort');
insert into dimLocation values('United States', 'Florida', 'Jacksonville');
insert into dimLocation values('United States', 'Florida', 'Tampa');
insert into dimLocation values('United States', 'Florida', 'Orlando');

-- dimPriceRange Inserts
insert into dimPriceRange values(10);
insert into dimPriceRange values(14);
insert into dimPriceRange values(18);
insert into dimPriceRange values(24);

-- brgRestaurantCuisine Inserts
-- Domino's: Pizza
insert into brgRestaurantCuisine values(1,1)
insert into brgRestaurantCuisine values(2,1)
insert into brgRestaurantCuisine values(3,1)

-- Domino's: Pasta
insert into brgRestaurantCuisine values(1,2)
insert into brgRestaurantCuisine values(2,2)
insert into brgRestaurantCuisine values(3,2)

-- Domino's: Subs
insert into brgRestaurantCuisine values(1,3)
insert into brgRestaurantCuisine values(2,3)
insert into brgRestaurantCuisine values(3,3)

-- Subway: Subs
insert into brgRestaurantCuisine values(4,3)
insert into brgRestaurantCuisine values(5,3)

-- Subway: Subs
insert into brgRestaurantCuisine values(4,4)
insert into brgRestaurantCuisine values(5,4)

-- Pizza Hut: Pizza 
insert into brgRestaurantCuisine values(6,1)

-- Pizza Hut: Pasta
insert into brgRestaurantCuisine values(6,2)

-- Burger King: Burgers
insert into brgRestaurantCuisine values(7,5)
insert into brgRestaurantCuisine values(8,5)
insert into brgRestaurantCuisine values(9,5)
insert into brgRestaurantCuisine values(10,5)

-- Burger King: Fries
insert into brgRestaurantCuisine values(7,6)
insert into brgRestaurantCuisine values(8,6)
insert into brgRestaurantCuisine values(9,6)
insert into brgRestaurantCuisine values(10,6)

-- Burger King: Chicken
insert into brgRestaurantCuisine values(7,7)
insert into brgRestaurantCuisine values(8,7)
insert into brgRestaurantCuisine values(9,7)
insert into brgRestaurantCuisine values(10,7)

-- Starbucks: Coffee
insert into brgRestaurantCuisine values(11,8)
insert into brgRestaurantCuisine values(12,8)
insert into brgRestaurantCuisine values(13,8)
insert into brgRestaurantCuisine values(14,8)
insert into brgRestaurantCuisine values(15,8)

-- brgRestaurantHighlight Inserts
-- Domino's: Delivery
insert into brgRestaurantHighlight values(1, 1)
insert into brgRestaurantHighlight values(2, 1)
insert into brgRestaurantHighlight values(3, 1)

-- Domino's: Drive-thru
insert into brgRestaurantHighlight values(1, 2)
insert into brgRestaurantHighlight values(2, 2)
insert into brgRestaurantHighlight values(3, 2)

-- Domino's: Open Late
insert into brgRestaurantHighlight values(1, 3)
insert into brgRestaurantHighlight values(2, 3)
insert into brgRestaurantHighlight values(3, 3)

-- Domino's: Open Kitchen
insert into brgRestaurantHighlight values(1, 4)
insert into brgRestaurantHighlight values(2, 4)
insert into brgRestaurantHighlight values(3, 4)

-- Domino's: Specials
insert into brgRestaurantHighlight values(1, 5)
insert into brgRestaurantHighlight values(2, 5)
insert into brgRestaurantHighlight values(3, 5)

-- Subway: Open Kitchen
insert into brgRestaurantHighlight values(4, 4)
insert into brgRestaurantHighlight values(5, 4)

-- Subway: Fountain Drinks
insert into brgRestaurantHighlight values(4, 6)
insert into brgRestaurantHighlight values(5, 6)

-- Pizza Hut: Delivery
insert into brgRestaurantHighlight values(6, 1)

-- Pizza Hut: Open Late
insert into brgRestaurantHighlight values(6, 3)

-- Pizza Hut: Specials
insert into brgRestaurantHighlight values(6, 4)

-- Burger King: Drive-thru
insert into brgRestaurantHighlight values(7, 2)
insert into brgRestaurantHighlight values(8, 2)
insert into brgRestaurantHighlight values(9, 2)
insert into brgRestaurantHighlight values(10, 2)

-- Burger King: Open Late
insert into brgRestaurantHighlight values(7, 3)
insert into brgRestaurantHighlight values(8, 3)
insert into brgRestaurantHighlight values(9, 3)
insert into brgRestaurantHighlight values(10, 3)

-- Burger King: Fountain Drinks
insert into brgRestaurantHighlight values(7, 6)
insert into brgRestaurantHighlight values(8, 6)
insert into brgRestaurantHighlight values(9, 6)
insert into brgRestaurantHighlight values(10, 6)

-- Starbucks: Drive-thru
insert into brgRestaurantHighlight values(11, 2)
insert into brgRestaurantHighlight values(12, 2)
insert into brgRestaurantHighlight values(13, 2)
insert into brgRestaurantHighlight values(14, 2)
insert into brgRestaurantHighlight values(15, 2)

-- Starbucks: Open Kitchen
insert into brgRestaurantHighlight values(11, 4)
insert into brgRestaurantHighlight values(12, 4)
insert into brgRestaurantHighlight values(13, 4)
insert into brgRestaurantHighlight values(14, 4)
insert into brgRestaurantHighlight values(15, 4)

-- factTable Inserts
-- Domino's
insert into factTable values(1, 1, 1, 1);
insert into factTable values(2, 4, 1, 1);
insert into factTable values(3, 5, 1, 1);

-- Subway
insert into factTable values(4, 3, 3, 2);
insert into factTable values(5, 4, 3, 2);

-- Pizza Hut
insert into factTable values(6, 6, 1, 3);

-- Burger King
insert into factTable values(7, 2, 1, 3);
insert into factTable values(8, 2, 1, 3);
insert into factTable values(9, 3, 1, 3);
insert into factTable values(10, 4, 1, 3);

-- Starbucks
insert into factTable values(11, 3, 2, 4);
insert into factTable values(12, 5, 2, 4);
insert into factTable values(13, 6, 2, 4);
insert into factTable values(14, 2, 2, 4);
insert into factTable values(15, 1, 2, 4);
