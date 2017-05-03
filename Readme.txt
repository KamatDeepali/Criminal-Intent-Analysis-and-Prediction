Criminal Intent: Analysis and Prediction -Release 1.0
Date: 13 May 2015


In order to install and set up the application the following steps should be performed,
1.	Following software's and environment's should be installed:
	•	Install JDK 7.0
	•	Install Oracle 11g Express Edition
	•	Install Apache Tomcat Server 7
	•	Install any web browser
2.	For the oracle 11g express edition set username and password as "SYSTEM", "12345" respectively

3.	As the application connects to the oracle 11g database for the data retrieval, create a table named  CHICAGOCRIMEDATA with the DDL as,
   CREATE TABLE "SYSTEM"."CHICAGOCRIMEDATA"
   (	"CASE_NUMBER" VARCHAR2(20 BYTE), 
	"H_DATE" DATE, 
	"BLOCK" VARCHAR2(100 BYTE), 
	"IUCR" VARCHAR2(10 BYTE), 
	"PRIMARY_TYPE" VARCHAR2(100 BYTE), 
	"DESCRIPTION" VARCHAR2(100 BYTE), 
	"LOCATION_DESC" VARCHAR2(100 BYTE), 
	"DISTRICT" NUMBER(10,0), 
	"WARD" NUMBER(5,0), 
	"COMMUNITY_AREA" NUMBER(5,0), 
	"YEAR" NUMBER(5,0), 
	"DATENMONTH" DATE
   ) 
4.	Import the csv file named CHICAGOCRIMEDATA.csv provided in the attached datasets, into the above table in the oracle database.

5.	Create a table named RISKWARDMONTH with DDL as follows,
   CREATE TABLE "SYSTEM"."RISKWARDMONTH" 
   (	"WARD" NUMBER(5,0), 
	"C_MONTH" VARCHAR2(10 BYTE), 
	"RISK" VARCHAR2(5 BYTE)
   )

6.	Import the csv file named wardmonthrisk.csv provided in the attached datasets into the above table

7.	Process to deploy the CrimeDetection.war on the apache tomcat server
	a.	CrimeDetection.war is submitted in the attachment.
	b.	To deploy the application on the Tomcat Server copy CrimeDetection.war into the webapps folder under Tomcat_Home

8.	Start the tomcat server

9.	Hit the url localhost:8081/CrimeDetection/  (The port number depends on which port the tomcat has been installed in this case it is         installed on 8081) on the web browser, the application is ready to use.

10.	We developed an application that allows any user to enter a particular location in Chicago and select a month from the drop down menu that he/she wishes to know about. Upon submitting choices, the application tries to match the entries with those in the database and then displays the risk factor of the ward that location belongs to and the crime percentage for the different types of crime in that region.

11.	The user needs to enter a valid location block address of Chicago into the textbox and month (drop down menu) for which he/she wants to fetch the crime risk
	E.g.  Of Location 
	056XX S MAY ST
	039XX W FULLERTON AVE


Contribution made by each member,

Apurwa : Data extraction, cleaning with the help of R and Rattle
	Generate and implement  box plots, histograms and map with ggplot and study them for predictive analysis
	Develope and implement the business logic in Java,jsp and servlets
	Design and build the database
	Building the graphical user interface and connecting the web application with the
	database using de servlets, jsp, oracle and html/css using JDBC
	designing and writing each report and posters for submissions

Deepali: initial data cleaning, threshold calculation for crime types
	 Studied Box plots,histograms and ggplots
         risk classification for each month based on box plots
         worked on understanding of ggplot but could not complete
         worked on writing and editing each report and the poster for the submissions 
             

Eric: Designed the ER diagram and the MVC architecture using draw it tool needed. 
       Studied Box plots,histograms and ggplots
      calculated means of crime types, and worked on classifying risk zones based on months
       researched on areas for neural network analysis for classification and clustering
       read papers on similar crime predictions in Chicago


