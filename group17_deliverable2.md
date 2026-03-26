Group 17 Deliverable
------------------------------------------------------------------------------------------------------
Populated Dimensional Model:
<img width="408" height="367" alt="image" src="https://github.com/user-attachments/assets/49d9436a-5275-44f0-800f-6003c0278827" />
<img width="398" height="360" alt="image" src="https://github.com/user-attachments/assets/a149562a-a8eb-4090-ae41-a31e64acc5de" />
Lineage Screenshot:
<img width="1414" height="775" alt="image" src="https://github.com/user-attachments/assets/c50ee5d7-aabd-47c0-afbb-f9b7f7c11884" />
Github Profiles:
Taz: https://github.com/TazJohnson/data-5360-dbt
Tyson: https://github.com/TysonMerrill/data-5360-dbt




<br> 
-------------------------------------------------------------------------------------------------------------------------------

Business Questions And Answers:
 
1. Which promotional campaign was most successful in sales?
-- fact sales, promotional campaign. Multiply quanity by price after discount. Group by promotional campaign name.
SELECT p.Campaign_Name, SUM(Quantity * Price_After_Discount) AS TotalSales
FROM ecoessentials_Fact_Sales fs JOIN ecoessentials_Dim_Promotion_Campaign p 
    ON fs.campaign_key = p.campaign_key
GROUP BY Campaign_Name
ORDER BY TotalSales DESC;
<img width="1920" height="973" alt="image" src="https://github.com/user-attachments/assets/acd915f2-ab6b-4589-861d-11a6b9f1cb8c" />


--2. How much of each product is bought on each day?
-- Fact sales, dim_product, dim_date
SELECT d.day_of_week, p.product_name, SUM(QUANTITY) AS ProductsBought
FROM ecoessentials_fact_sales fs JOIN ecoessentials_dim_product p
    ON fs.product_key = p.product_key JOIN  ecoessentials_dim_date d
    ON fs.date_key = d.date_key
GROUP BY d.day_of_week, p.product_name
ORDER BY d.day_of_week, ProductsBought DESC;
<img width="1920" height="966" alt="image" src="https://github.com/user-attachments/assets/7e742609-acfe-44a0-b8c5-d96fc7b0f535" />


--3. Which campaigns led to the most product bought in each city?
-- Fact sales, dim_product, dim_customer, dim_promotional_country
SELECT
c.customer_city,
pc.campaign_name,
SUM(fs.quantity) AS total_products_bought
FROM ecoessentials_fact_sales fs
JOIN ecoessentials_dim_customer c
    ON fs.customer_key = c.customer_key
JOIN ecoessentials_dim_promotion_campaign pc
    ON fs.campaign_key = pc.campaign_key
GROUP BY c.customer_city, pc.campaign_name
ORDER BY total_products_bought DESC;

   <img width="1920" height="970" alt="image" src="https://github.com/user-attachments/assets/4e526161-3321-4842-9384-b243bc623dab" />
