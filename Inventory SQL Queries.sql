Use inventory_project;
#Total_Sales
SELECT SUM(`Sales Amount`) as Total_Sales from f_point_of_sale; 
#Productwise_Sales
SELECT `Product Group`, SUM(`Sales Amount`) AS Total_Sales FROM f_inventory_adjusted,f_point_of_sale GROUP BY `Product Group`
ORDER BY Total_Sales DESC;
#Total Inventory
select * from `f_inventory_adjusted`;
SELECT SUM(`Quantity on Hand`) AS total_sum FROM `f_inventory_adjusted`;
#In Stock, under stock and out of stock
SELECT `Product Name`,`Quantity on Hand`, CASE WHEN `Quantity on Hand` = 0 THEN 'Out of Stock' WHEN `Quantity on Hand` < 5 THEN 'Under Stock' ELSE 'In Stock' END AS Stock_Status
FROM `f_inventory_adjusted`;
#Purchase_method
select * from `f_sales`;
SELECT `Purchase Method`, COUNT(*) AS Method_Count FROM `f_sales` GROUP BY `Purchase Method`;
#Monetary value of current inventory
SELECT SUM(`Quantity on Hand` * `Price`) AS total_inventory_value
FROM `f_inventory_adjusted`;
#Regionwise_Sales
SELECT `Cust Region`, SUM(`Sales Amount`) AS Total_Sales FROM d_customer, f_point_of_sale 
GROUP BY `Cust Region`ORDER BY Total_Sales DESC;
#Top 6 Storewise Sales
SELECT `Store Name`,SUM(`Sales Amount`) AS Total_Sales
FROM d_store, f_point_of_sale
GROUP BY `Store Name` ORDER BY Total_Sales DESC LIMIT 6;
#Statewise_Sales
SELECT `State Name`, SUM(`Sales Amount`) AS Total_Sales
FROM d_geojson_us_counties, f_point_of_sale
GROUP BY `State Name` ORDER BY Total_Sales DESC;





