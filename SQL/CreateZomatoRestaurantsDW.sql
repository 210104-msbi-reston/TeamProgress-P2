create ZomatoRestaurantsDW;
use ZomatoRestaurantsDW;

create table dimGenre(
	genreID int primary key identity,
	genreType [varchar](20)
);

create table dimStore(
	storeID int primary key identity,
	restaurantName [varchar](70)
);

create table dimPriceRange(
	priceRangeID int primary key,
	costForTwo int
);

create table dimLocation(
	locationID int primary key identity,
	countryName varchar(20),
	stateName varchar(20),
	cityName varchar(20),
	localityName varchar(70)
);

create table factRestaurant(
	restaurantID int primary key identity,
	storeID int foreign key references dimStore(storeID) default 1,
	locationID int foreign key references dimLocation(locationID),
	genreID int foreign key references dimGenre(genreID),
	priceRangeID int foreign key references dimPriceRange(priceRangeID),
	restaurantAddress varchar(210),
	averageRating numeric(5, 2),
	numberOfPhotos int,
	numberOfVotes int
);

GO
create view RestaurantStoreID as
select db1.restaurantID, db2.storeID, db1.restaurantName
from ZomatoRestaurants.dbo.tbl_Restaurants as db1
join ZomatoRestaurantsDW.dbo.dimStore as db2
on db1.restaurantName = db2.restaurantName

GO
create procedure proc_update_factRestaurant_storeID
as
update factRestaurant 
set factRestaurant.storeID = RestaurantStoreID.storeID
from factRestaurant join RestaurantStoreID 
on factRestaurant.restaurantID = RestaurantStoreID.restaurantID;