# Project README

## Overview

This project demonstrates preparing and storing data for a MySQL database. It includes:

- **SQL script (`uma_schema.sql`)**: Creates the database schema.  
- **JSON file (`data.json`)**: Contains the dataset extracted from a website.  
- **JavaScript file (`scraper.js`)**: Contains browser console queries that were used to scrape the data, which was then saved into `data.json`.  

## Files

### 1. `uma_schema.sql`
Defines the structure of the database, including tables and relationships. Running this script in MySQL creates the necessary schema to store the data.

### 2. `data.json`
Contains the scraped dataset, formatted to match the database schema. This is the data intended for import into MySQL.

### 3. `scraper.js`
Contains queries that were run in a web browser console to extract the data. The results from these queries were saved into `data.json`. **This file is not intended to run as a standalone script.**

## Usage

1. **Create the Database**
   - Run the SQL script:

     ```bash
     mysql -u your_username -p < uma_schema.sql
     ```

2. **Load Data into MySQL**
   - Import the dataset from `data.json` using your preferred method (Node.js script, MySQL Workbench, or CLI).  

3. **Scrape / Inspect Data**
   - `scraper.js` can be referenced to see the browser console queries used to extract the data originally.  

## Notes

- Ensure MySQL is running before creating or importing the database.  
- Field names in `data.json` correspond to columns in the database schema.  
- `scraper.js` documents the data extraction process; it is not a full scraping tool.
