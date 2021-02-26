<img src= "https://github.com/210104-msbi-reston/TeamProgress-P2/blob/master/Images/zomatologo5.png?raw=true">

# Zomato Restaurant Business Analysis
## Description
Our project will analyze restaurant data that has been pulled from Zomato. Zomato is a online resource that offers restaurant information, menus, customer reviews, as well as food delivery options from partnered restaurants in select areas. Several datasets will be extracted, transformed, and loaded into a singular data warehouse. Analytical services will be used to provide statistical data that can be utilized to make informed business decisions, including ideal locations to receive favorable reviews, what kind of cuisine will ensure a successful business, what kind of accomodations and services will lead to being favorably reviewed, and what markets are oversaturated/untapped to assist businesses that are interested in opening a new restaurant in the country of India.

## Tech Stack
* Microsoft Excel
* Microsoft SQL Server 2016
* Microsoft SQL Server Management Studio (SSMS)
* SQL Server Integrations Services (SSIS)
* SQL Server Analysis Services (SSAS)
* SQL Server Reporting Services (SSRS)
* Microsoft Power Bi

## Getting Started
There are two options to setup this project. The first option involves restoring backups of the Relational Database and the Data Warehouse. The second option
involves running a script file to setup the schema and then running the SSIS packages to load the database.

### Requirements
* Ensure SQL Server Management Studio is installed.
* Ensure Visual Studio 2017 (SSDT) is installed.
* git clone https://github.com/210104-msbi-reston/TeamProgress-P2.git

### Option 1 - Backups
* Navigate to the TeamProgress-P2\Database Backup folder in the cloned repository.
* Extract the files from ZomatoRestaurants.zip into your SQL Server Instance backup folder.
  * This is typically located at C:\Program Files\Microsoft SQL Server\\[instance name]\MSSQL\Backup
* Once successful, open SSMS and connect to the database engine/SQL Instance you put the backup files in.
* After connecting, right click the Databases folder and select "Restore Database.
* Under "Source" select Device and click the button with the ellipses "..."
* When the new windows appears, click "Add" and if you've done it successfully, you should see the backup files you unzipped listed.
* Restore the ZomatoRestaurants.bak and the ZomatoRestaurantsDW.bak to load the relational database and the data warehouse.

### Option 2 - Schemas
* Navigate to the TeamProgress-P2\SQL folder in the cloned repository.
* Extract the files from ZomatoRestaurants_SchemaData.zip.
* Open the two SchemaData files in SSMS and execute each query.
  * This will take anywhere from 5-10 minutes each.

### Option 3 - SSIS Packages
* Navigate to the TeamProgress-P2\SQL folder in the cloned repository.
* Open the files named DBCreateTables.sql and DWCreateTables.sql in SSMS and execute the queries.

#### Populate Distinct Tables


#### Restaurant Facts


## SSAS and the Cube
* Navigate to TeamProgress-P2\SSAS in the cloned repository.
* Extract the files from ZomatoCube.zip.
* Open ZomatoCube.sln with Visual Studio 2017 (SSDT).
* Right click the bold ZomatoCube and select Properties.
* In Configuration Properties on the left, click Deployment.
* Insert the name of the Analysis Service instance you want to deploy to. Hit OK.
* Double click ds_ZomatoRestaurantsDW.ds in Data Sources and click Edit under Connection String.
* Change the Server Name to the Database Engine instance you hosted the data warehouse on.
* In the "Connect to a databse" section, click the drop down arrow and select "ZomatoRestaurantsDW". Click OK.
* Click the "Impersonation Information" tab at the top and select "Use a specific Windows user name and password".
* Enter the credentials of the Windows account you are currently logged into. Click OK.
* Right click dsv_ZomatoRestaurantsDW.cube and click Process.
* Click yes in both menus and enter your login information if prompted.
* Click Run... on the Process Cube window when prompted.
* Click close when finished processing. The cube should now be successfully deployed and queryable through both SSMS and SSAS.

## SSRS and Power Bi


## Team Members
* Jonathan Tucker - Team Leader
* Kathleen Labog - Co-Leader
* Taylor Jernigan
* Ricki Nguyen

## Data Source
* [Zomato Restaurants in India](https://www.kaggle.com/rabhar/zomato-restaurants-in-india) 
* [India Ctites/States](https://github.com/voidns/india_cities_states/blob/master/india_cities_states_feb_2015.csv)
* [India ESRI](http://www.diva-gis.org/gdata)  

## Organizational Links
* [Trello Board](https://trello.com/b/hv9wI9H0/zomato-restaurant-business-analysis)  
* [DB ER Diagram](https://lucid.app/lucidchart/c74c8a00-b9c8-4a51-a9ef-5833cc8dea87/view?page=0_0#?folder_id=home&browser=icon)  
* [DW Schema Diagram](https://lucid.app/lucidchart/4cf69f14-a06a-4e67-a013-d2817c1b7cc0/view?page=0_0#?folder_id=home&browser=icon)

## License
This project uses the following license: 
* [SQL Server Management Studio ](https://docs.microsoft.com/en-us/legal/sql/sql-server-management-studio-license-terms)
* [SQL Server Data Tools ](https://docs.microsoft.com/en-us/legal/sql/sql-server-management-studio-license-terms)
* [Microsoft Office 365](https://www.microsoft.com/en-us/Useterms/Retail/OfficeinMicrosoft365/Personal/Useterms_Retail_OfficeinMicrosoft365_Personal_English.htm)
