# Banners serving application

This is simple web-application to serve banners for an advertising agency.

## Introduction

For this application "Rails" was chosen as a framework because it is very popular and there are a lot of tutorials and blog articles about it. Also, for this small 
tutorial project, SQLite was chosen as a database since it is small and very simple. 

## Realisation

As almost all Rails applications, this application based on MVC template. The Campaigns controller proceeds user request and asks Campaign model for a set of banners. A random permutation of a set is storing in users cookies as well as a current index of the new banner. This approach was chosen to reduce the number of database requests since a maximum number of banners per campaign is ten. When user finished the stored sequence, Campaigns controller asks again Campaign model for a set of banners and so on. All cookies stored "as is" since there are almost not any reasons for secure encoding data for advertising. 
Unique user tokens were storing in a database for the case of updating campaigns data. Therefore all campaigns will forcefully restart after cleaning users table. Initial CSV files were importing to the database and present in the application as models. 