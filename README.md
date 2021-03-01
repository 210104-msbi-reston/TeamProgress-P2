<img src= "https://github.com/210104-msbi-reston/TeamProgress-P2/blob/master/Images/zomatoheader.png">

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
There are three options to setup this project. The first option involves restoring backups of the Relational Database and the Data Warehouse. The second option involves executing the SchemaData sql files for the Relational Database and the Data Warehouse. The third option 
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
<img src = "https://github.com/210104-msbi-reston/TeamProgress-P2/blob/master/Images/Image%20of%20Database%20Restore.png?raw=true" width="600">  

* Under "Source" select Device and click the button with the ellipses "..."  
<img src= "https://github.com/210104-msbi-reston/TeamProgress-P2/blob/master/Images/RestoreDatabaseDialogBox.png?raw=true" width = "600">

* When the new windows appears, click "Add" and if you've done it successfully, you should see the backup files you unzipped listed.  
<img src = "https://github.com/210104-msbi-reston/TeamProgress-P2/blob/master/Images/Image%20to%20select%20backup%20media.png?raw=true" width = "600">

* Restore the ZomatoRestaurants.bak and the ZomatoRestaurantsDW.bak to load the relational database and the data warehouse.

### Option 2 - Schemas
* Navigate to the TeamProgress-P2\SQL folder in the cloned repository.
* Extract the files from ZomatoRestaurants_SchemaData.zip.
* Open the two SchemaData files in SSMS
* Adjust the FILENAME attribute in lines 7 & 9 to point to your respective Microsoft SQL directories  
<img src = "https://github.com/210104-msbi-reston/TeamProgress-P2/blob/master/Images/Image%20for%20Renaming%20Path%20in%20Schema%20script.png?raw=true" width = "800">

* Execute each query.
  * This will take anywhere from 5-10 minutes each.
### Option 3 - SSIS
* Navigate to the TeamProgress-P2\SQL folder in the cloned repository.
* In SQL Server Management Studio, execute both the DBCreateTables.sql and DWCreateTables.sql
  * Ensure that from DBCreateTables.sql that all CREATE TABLE lines are executed successfully 
  * Ensure that from DWCreateTables.sql that all CREATE TABLE lines are executed successfully and the CREATE PROCEDURE line
* From SSDT, open a new Integration Services project. 
* In the solution explorer, right-click the SSIS Packages folder and add PopulateDistinctTables.dtsx and RestaurantFacts.dtsx from the TeamProgress-P2\SSIS folder
* From the Solution Explorer, double-click the PopulateDistinctTables.dtsx file to open the Design window for the package
* In the Connection Managers pane at the bottom of the Design window, reconnect each connection manager to a similarly named flat file in TeamProgress-P2\Datasets folder or to your SQL Server DB as necessary
<img src ="https://github.com/210104-msbi-reston/TeamProgress-P2/blob/CleaningSSISDbPackage/Images/Image%20to%20Reset%20Connection%20Managers%20DB.png?raw=true" width="800">  

  * DistinctCities connects to DistinctCities.txt
  * DistinctCountries connects to DistinctCountries.txt 
  * DistinctCuisines connects to DistinctCuisines.txt
  * DistinctGenres connects to DistinctGenres.txt
  * DistinctHighlights connects to DistinctHighlights.txt
  * DistinctLocalities connects to DistinctLocalities.txt
  * DistinctPriceRanges connects to DistinctPriceRanges.txt
  * DistinctRestaurants connects to DistinctRestaurants.txt
  * DistinctStates connects to DistinctStates.txt
  * LAPTOP-SDFHP9DE.ZomatoRestaurants 1 connects to your ZomatoRestaurants DB instance in SSMS
* Press Start at the top to begin populating your ZomatoRestaurants DB. (This can take 20+ minutes depending on your system. Please be patient)
* After the PopulateDistinctTables.dtsx package finishes, from the Solution Explorer, double-click the RestaurantFacts.dtsx file to open the Design window for the package
* In the Connection Managers pane at the bottom of the Design window, reconnect one connection manager to your SQL Server DB instance and the other to your SQL Server DW instance
<img src ="https://github.com/210104-msbi-reston/TeamProgress-P2/blob/CleaningSSISDbPackage/Images/Image%20to%20Reset%20Connection%20Managers%20DW.png?raw=true" width="800">  

  * LAPTOP-VCDB75JF\REVATUREJT.ZomatoRestaurants connects to your ZomatoRestaurants DB instance in SSMS
  * LAPTOP-VCDB75JF\REVATUREJT.ZomatoRestaurantsDW connects to your ZomatoRestaurantsDW Dw instance in SSMS 
* Press Start at the top to begin populating your ZomatoRestaurants DW. (This will only take 1-2 minutes depending on your system. Please be patient)  

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
* Navigate to TeamProgress-P2\Reports\SSRS.
* Extract the files from the ZomatoReportsFormatted.zip.

* Open Reporting Services Configuration Manager. 
* Connect to your Reporting instance.
* Go to Web Service URL and click Apply.
* Go to Web Portal URL and click Apply.
* Go back to Web Service URL and copy the link under Report Server Web Service URLs.

* Open ZomatoReports.sln with Visual Studio 2017 (SSDT).
* Right click the bolded ZomatoReports under the Solution Explorer pane.
* Go to Properties.
* In General under Deployment, paste the Web Service URL link into TargetServerURL. Click OK.

* In the Solution Explorer under Shared Data Sources, double click ZomatoCubeKL.rds. 
* In Shared Data Properties, ensure the Type is Microsoft SQL Server Analysis Services.
* Click Build...
* Type in the name of your Analysis server under Server name.
* Select ZomatoCube for Select or enter a database name.
* Click Test Connection to ensure the connection works. Click OK.
* Go to Credentials and ensure Use Windows Authentication (integrated security) is selected. Click OK.
* Ensure you can view the reports by clicking preview in the design window of the OverSaturatedMarkets report. This report does not require parameters and is not linked so should load within seconds.
* If successfully able to preview, right click the bolded ZomatoReports under the Solution Explorer pane.
* Click Build and ensure the build is successful.
* Right click the bolded ZomatoReports and click Deploy. 

* Go back to Reporting Services Configuration Manager.
* Go to Web Portal URL and click on the URL.

* On the SQL Server Reporting Services website, select the ZomatoReports folder.
* In the folder, there should be 14 paginated reports. 
* Click MapController to navigate through all the available reports.

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
