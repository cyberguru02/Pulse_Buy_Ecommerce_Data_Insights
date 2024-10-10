# Pulse Buy Ecommerce_Data Insights


# Project Summary
Pulse Buy is a global e-commerce platform specializing in popular electronics, delivering top-tier products to customers around the world. As part of my analysis, I worked on a dataset that combined real-world data, randomly generated data, to uncover critical business insights.

In this project, I investigated key areas of Pulse Buy's performance, including:

- 	Revenue growth trends
- 	Average Order Value (AOV
- 	Product popularity
- 	Marketing channel effectiveness
- 	Refund rates
- 	Shipping efficiency


I also analyzed the effectiveness of PulseBuy's newly launched loyalty program, assessing its impact on these key areas ultimately offering recommendations for its future.


To derive actionable insights, I utilized a range of tools and techniques, including SQL for data querying, Pandas in Python for statistical analysis and data manipulation, dashboards for visual storytelling, and pivot tables with conditional formatting for advanced analysis. Aggregation functions and statistical analysis were essential for summarizing the results, which were delivered to the finance and product teams to guide decision-making and strategy.


- **Part 1: Trends**

Utilizing Excel, I conducted a comprehensive analysis of broad trends to extract key insights for the finance and product teams. This analysis showed trends such as seasonal sales patterns, year-over-year revenue growth, and variations in Average Order Value (AOV).

- **Part 2: Targeted Insights**

Employing SQL, I derived targeted insights tailored for the finance and marketing teams. This involved an in-depth examination of product sales, purchase platform, and identifying the most effective marketing channels. Notably, I pinpointed products with the highest refund rates and analyzed regional sales trends for key offerings.

  
- **Part 3: Data Analysis with Pandas**

I leveraged Pandas in Python to execute advanced statistical analysis and efficiently manipulate large datasets. This facilitated the cleaning and transformation of data, calculation of summary statistics, and identification of correlations among various metrics, including revenue, order values, and customer behavior. The aggregation functions in Pandas were instrumental in uncovering hidden patterns, such as trends in refund rates and fluctuations in product popularity over time.


  
- **Part 4: Visualizations**

I utilized Tableau to develop interactive dashboards, enabling the finance and product teams to monitor critical metrics, including sales trends, product performance, and shipping efficiency. These dashboards were also accessible to the sales and operations teams to facilitate ongoing performance tracking.

  
- **Part 5: Recommendations & Next Steps**

Points to consider for future review and improvement.
  

The dataset I will be utilizing is organized across four tables, encompassing details related to orders, order statuses, customers, and geographic information.

Entity Relationship Diagram (ERD)


<img width="605" alt="Pulse_Buy_ERD" src="https://github.com/user-attachments/assets/89569eed-e0d9-4059-b597-5367534e6b4a">


# Executive Summary

### Overview of Findings

The findings reveal several key trends for stakeholders to consider. First, sales are increasingly driven through multiple platforms, including mobile apps and websites, which exhibit substantial activity. This underscores the importance of optimizing user experiences across these channels to further boost sales performance. Additionally, there are significant regional variations in pricing due to differences in local currencies. This highlights the need for a more nuanced pricing strategy to maintain both profitability and customer satisfaction in various global markets. Furthermore, customer loyalty programs show different levels of engagement across regions, with some areas seeing higher participation. By tailoring loyalty programs to align with regional preferences, businesses could improve customer retention and foster long-term growth.


# Insights Deep Dive
### Part 1: Trends (Excel):

### Yearly:


- 	During 2021, during the middle of the pandemic, the highest average order value (aov) was $64
- 	Total sales growth decreased by 2.04%, but increased by 22.32% in 2023
- 	Decreased by 24.53% in total revenue in 2022
  
- 	Sales figures up to September 2024 may prove to be concerning, as they are below the usual range and may not meet expected quarterly levels. This decline can be linked to several external factors affecting the e-commerce landscape. Economic uncertainty, driven by rising interest rates, has led to decreased consumer spending. Additionally, supply chain disruptions—especially in technology and consumer electronics due to semiconductor shortages—have impacted product availability. Seasonal fluctuations, along with waning consumer confidence stemming from geopolitical tensions, have further contributed to the downward trend. Moreover, the pandemic's lingering effects continue to influence consumer behavior, altering spending patterns and prioritizing essential goods over discretionary purchases, which has particularly affected sectors like travel and hospitality.


### Seasonality:


- 	Quarter 1 (Winter) and Quarter 4 (Fall) consistently outperform other quarters in sales, order volume, and average order value (AOV). This trend can be attributed to holiday shopping in Quarter 4, including major events like Black Friday and Christmas, which drive significant sales. 
- 	In Quarter 1, post-holiday promotions and consumer behavior focused on indoor products lead to increased spending. Additionally, New Year resolutions encourage purchases related to fitness and self-improvement, while targeted marketing efforts and seasonal products further boost demand during these quarters.

### Products:


- 	The Adjustable Laptop Stand and Portable Solar Charger, throughout the past 4 years, has been the best-selling product in terms of total orders with 7.25 units sold per year on average. 
- 	The Adjustable Laptop Stand and Portable Solar Charger together accounted for approximately 31.35% of all orders.
- 	In 2nd of most total orders, on average, was the Fitness Tracker Smartwatch of 6 units per year.
- 	The Fitness Tracker Smartwatch accounted for approximately 10.27% of all orders.


### Loyalty Program:


- •	We recommend continuing to invest in the loyalty program. In 2021, loyalty program members had an average order value (AOV) $21 higherthan non-members. By 2024, this difference has grown even further, with loyalty members spending 29 more per order on average compared to non-members. 
  
- •	In terms of total sales, loyalty program members consistently generate more revenuethan non-members. For example, in 2023, loyalty members generated 316 more in sales than non-members. This trend continues, with members contributing significantly to overall revenue growth.
  
- •	Furthermore, loyalty members have demonstrated greater engagementover time. Despite a slight decline in total orders from loyalty members in 2024, their higher AOV and more consistent sales growth highlight their value. Expanding the program and leveraging their greater openness to targeted marketing could continue to drive significant revenue increases.

- •	The percentage sales difference between loyalty and non-loyalty members has reached 302%, with a 67% AOV difference and a 140% difference in total orders from 2021 to 2024.




After cleaning and analyzing the findings by making use of Pivot Tables, conditional formatting, aggregation functions, and statistics analysis, the results are summarized to the finance and product teams.


Below is the Quarter/Season pivot table utilized to gain insights:



![image](https://github.com/user-attachments/assets/3c3182fd-744a-4ca4-a704-46867cd0d076)






















### Part 2: Targeted Insights (SQL):

### Yearly:


- 	The Portable Solar Charger generated a total of $600 in sales across 12 orders over the four years, averaging $50 per month. This consistent performance suggests steady demand for this product.
- 	The mobile app purchase platform generated a total of $2,509 in sales, with an average order value of $57 across 44 total orders. In contrast, the website platform achieved $7,254 in total sales with an average order value of $51 from 141 total orders.
- 	In terms of growth, the mobile app showed a total sales growth rate of 25.80% from 2022 to 2023, despite a slight decline of 1.79% from 2023 to 2024. The average order value for the mobile app reached its peak in 2024 at $70.
  
- 	On the other hand, the website platform experienced a significant drop in sales growth of -33.03% in 2024, with its average order value decreasing to $61.


- 	•	Average of 17.75 days for processing time and 4.6 days for fulfillment time.

In this analysis, I utilized SQL and SQLite. Specifically, I employed aggregation functions, window functions, joins, filtering techniques, CASE expressions, common table expressions (CTEs), and occasionally the QUALIFY clause with row_number() to refine the results.


Below is an example of a query clause showcasing the average amount of days to purchase for all customers:


```sql
/* Avg amount of time between customer registration and initial purchase 
   Averaging the amount of days to purchase for all customers */

WITH initial_order_cte AS (
    SELECT orders.customer_id AS customer_id, MIN(orders.purchase_date) AS initial_order
    FROM pulse-415501.pulsebuy.orders AS orders
    GROUP BY 1
) 
SELECT ROUND(AVG(DATE_DIFF(initial_order_cte.initial_order, customers.account_creation_date, DAY)), 2) AS days_to_purchase
FROM pulse-415501.pulsebuy.customers AS customers 
INNER JOIN initial_order_cte ON customers.customer_id = initial_order_cte.customer_id;
```



### Part 3: Data Analysis with Pandas:


- 	Predicted Deliver Days Per Item:
     - Premium Organic Coffee Beans – 4.15
     - Portable Solar Charger – 5.70
     - Adjustable Laptop Stand – 3.55
     - Eco-Friendly Yoga Mat – 5.48
     - Fitness Tracker Smartwatch – 4.49
     - LED Strip Lights – 4.35
     - SmartHome Assistant Hub – 4.64
     - Stainless Steel Insulated Water Bottle – 3.93
     - Wireless Noise-Canceling Headphones – 5.12

- 	The projected sales for the upcoming month are expected to total $251.99.
- 	In terms of growth, the mobile app showed a total sales growth rate of 25.80% from 2022 to 2023, despite a slight decline of 1.79% from 2023 to 2024. The average order value for the mobile app reached its peak in 2024 at $70.
  
In this section, I primarily used Python with Jupyter Notebook. I utilized libraries such as pandas for data manipulation, numpy for numerical operations, and statsmodels for statistical modeling. Additionally, I employed matplotlib and seaborn for data visualization, while scipy was used for various statistical functions.


Here is a code snippet that shows next month’s projected sales for each item: 

```python

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats

df = pd.read_csv(r"…\pulse_buy_tableau_dataset.csv")

# Convert purchase_date to datetime if not already in datetime format
df['purchase_date'] = pd.to_datetime(df['purchase_date'])

# Aggregate total sales by month (or any other time period)
df['purchase_month'] = df['purchase_date'].dt.to_period('M')  # Group by month
monthly_sales = df.groupby('purchase_month')['price_usd'].sum().reset_index()

# Prepare data for regression analysis
monthly_sales['month_number'] = np.arange(len(monthly_sales))  # Create a numeric variable for months

# Define the dependent and independent variables
X = monthly_sales['month_number']
Y = monthly_sales['price_usd']

# Add a constant to the independent variable
X = sm.add_constant(X)

# Fit the regression model
model = sm.OLS(Y, X).fit()

# Print the regression results
print(model.summary())

# Predict the next month's sales
next_month = len(monthly_sales)  # The next month (after the last month in the dataset)
next_month_sales = model.predict([1, next_month])  # [constant, month_number]

print(f"Predicted sales for next month: ${next_month_sales[0]:.2f}")

# Plotting the regression line
plt.figure(figsize=(10, 6))
plt.scatter(monthly_sales['month_number'], monthly_sales['price_usd'], color='blue', label='Monthly Sales Data')

# Plot the regression line
plt.plot(monthly_sales['month_number'], model.predict(X), color='red', label='Regression Line')

# Plot the predicted sales for next month as a green dot
plt.scatter(next_month, next_month_sales, color='green', marker='o', s=100, label='Predicted Next Month Sales')

# Annotate the predicted point
plt.annotate(f'Predicted: ${next_month_sales[0]:.2f}', 
             xy=(next_month, next_month_sales), 
             xytext=(next_month + 0.5, next_month_sales + 10),  # Adjust text position as needed
             arrowprops=dict(facecolor='black', arrowstyle='->'),  # Arrow style
             fontsize=10, 
             color='green')  # Color of the annotation text



# Annotations for clarity
plt.title('Monthly Sales Prediction')
plt.xlabel('Month Number')
plt.ylabel('Total Sales (USD)')
plt.xticks(monthly_sales['month_number'], monthly_sales['purchase_month'].astype(str), rotation=45)
plt.legend()
plt.tight_layout()
plt.grid(True)  # Optional: Add a grid for better readability
plt.show()
```

![image](https://github.com/user-attachments/assets/dad23495-731a-4233-b62a-2f7b949a1478)

  
### Part 4: Visualizations (Tableau):


Sales Trends:
-  From 2021 to 2024, sales were predominantly driven by a few key products, notably the Adjustable Laptop Stand and Portable Solar Charger, which together accounted for 31.35% of total orders, with their highest amount of total orders accounting for approximately 70% in most Q4. We also see a trends for least-popular items like the headphones and assistant hub products making a good amount total percentage of sales averaging approximately 45% during Q2 and Q3. 
-  There were noticeable peaks in sales during Q4 (Fall) due to holiday shopping, particularly during events like Black Friday and Christmas. This seasonal trend emphasizes the need for targeted marketing strategies during these peak periods for not only their in-demand items, but also gain more for their less-in-demand items during those quarters such as noise-cancelling headphones and smart assistant hub.  The same can be said for items such as the Adjustable Laptop Stand and Portable Solar Charger during Q2 and Q3 since they are least ordered during those times.

Shipping Performance:
- Shipping times revealed significant variability, with an average processing time of 17.75 days and an average fulfillment time of 4.6 days across all years. This inconsistency highlights potential areas for improvement in logistics and supply chain management.
- Least popular items such as the wireless noise-canceling headphones and more popular items like the portable solar charger typically take longer to ship with the highest peak of 7 days compared to the other items. This indicates that the warehouse of Pulse Buy typically has an lax attitude towards preparing less-in-demand products, and potentially have bottle-neck issues on shipping out their popular items.  

Marketing Channel Effectiveness:
- The website platform remains the dominant sales channel, generating $7,254 in sales, while the mobile app shows promising growth with a 25.80% increase in sales from 2022 to 2023. The average order value for mobile app purchases reached $70 in 2024, suggesting that it is gaining traction among customers.
- Those that purchase through mobile often order the fitness smartwatch, likely due to its convenience for active lifestyles, targeted mobile promotions, and compatibility with health apps that mobile users frequently utilize.
-	There is a significant display in sales engagement across different marketing channels and purchase platform, targeting the need for tailored strategies to optimize performance.
-	Interestedly, marketing channels such as affiliates attract people who purchase yoga mats, while email campaigns draw in customers for laptop stands. This is because affiliates often target fitness and wellness communities, whereas email campaigns highlight productivity and ergonomic products, appealing to those seeking efficient work setups.




For this section, I primarily utilized Tableau, along with MySQL employed to generate the dataset. The Tableau dashboard includes interactive filters, tables, line graphs, and area charts for comprehensive analysis.

![image](https://github.com/user-attachments/assets/d74e4786-ea9c-498b-a5c4-3599d02ff5a1)


  
- **Part 5: Recommendations & Next Steps**

- Enhance Product Descriptions for Better Customer Engagement: Improving product descriptions on Pulse Buy should be a top priority. By focusing on creating clear, engaging, and detailed descriptions, you can enhance customer experience and boost conversions. One strategy to consider is using a combination of vivid imagery and concise yet informative content, similar to successful e-commerce platforms like Amazon or Best Buy. These retailers optimize descriptions to address key customer concerns while highlighting the benefits of the product.

- Leverage Data-Driven Insights for Targeted Marketing: Utilize data gathered from the Python scripts and analysis to refine marketing strategies. Identifying patterns, correlations, and customer preferences will allow for more personalized and focused advertising and product recommendations, helping to increase customer retention and low-popular product sales. 

- Incorporate Financial Metrics into Performance Analysis: Start integrating key financial metrics into your performance reviews, such as customer acquisition costs, product return rates, and net profit margins. This can provide a more comprehensive understanding of the platform's profitability and guide the decision-making process on what products or strategies to prioritize moving forward. 
 
- Improve Shipping and Fulfillment Consistency: Look into streamlining shipping processes to reduce volatility in delivery times and be flexible with altering shipping plans during different quarters, especially for high-demand products of a respective quarter such as smart assistant hub and Portable Solar Charger. Poor shipping performance can impact customer satisfaction, so optimizing fulfillment operations could enhance the overall buying experience.
