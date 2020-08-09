# Olist dataset

Many of our lectures will be based on a dataset uploaded by a Brazilian E-Commerce platform called olist that they generously published through [kaggle.com](https://www.kaggle.com/olistbr/brazilian-ecommerce/). Please check the website for more detailed
information on the dataset.

## Loading the dataset

To load the dataset into your local MySQL database, follow these instructions:

1. Download the .sql file from [here](https://drive.google.com/open?id=1yOrzRBx8gIUUFO-CDEVjUft7OLhVY4M-)

2. Open your preferred MySQL client and run the .sql file you downloaded
    1. **MySQl Workbench**:
        1. Open MySQL Workbench and click on your existing MySql connection
        2. Click on `File -> Run SQL Script...` 
        3. Pick the `olist_dump.sql` file you downloaded

    2. **Sequel Pro**
        1. Open Sequel Pro and connect to your database
        2. Click on `File -> Open...`
        3. Pick the `olist_dump.sql` file you downloaded
        4. After the file was loaded, you should see the content of the file in your sql editor. Highlight everything (CMD+A / Ctrl+A) and click on `Run Selection`
        
    3. **mysql cli**
        1. From your command line, run:
        ```bash
        mysql -h localhost -u root -p < [path to the `olist_dump.sql` file]
        ```
        2. Type in your root password and wait for it to finish (could take a few minutes)
        3. If you created an alternative user, replace `root` with the user you created

3. If the import ran successfully, you should be able to run queries. Try running:

```sql
SELECT *
FROM olist.orders
LIMIT 10;
```
