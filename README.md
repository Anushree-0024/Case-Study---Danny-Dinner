# Case Study #1: Danny's Diner | 8 Week SQL Challenge

Analyzing customer purchasing behavior, restaurant sales, and loyalty program performance using SQL.

##  Project Overview

Danny's Diner is a Japanese restaurant that serves three popular dishes: sushi, curry, and ramen. The restaurant has collected customer transaction data but needs to turn it into meaningful insights to better understand purchasing patterns, identify popular menu items, and evaluate its customer loyalty program.

This project is part of the **[8 Week SQL Challenge](https://8weeksqlchallenge.com/case-study-1/)** by Danny Ma from Data With Danny.

The objective is to analyze customer transactions using SQL and answer key business questions that can help the restaurant make data-driven decisions and deliver a more personalized customer experience.

In this case study, I explored relational datasets using MySQL to solve business questions related to customer spending, purchasing patterns, product popularity, and loyalty program performance. I applied SQL concepts to transform raw transaction data into meaningful business insights.

##  Business Objectives

- Analyze total customer spending and restaurant visit frequency.
- Identify the most popular menu items and customer-specific preferences.
- Understand purchasing behavior before and after customers join the loyalty program.
- Calculate customer loyalty points based on spending and promotional rules.
- Create reusable datasets that simplify reporting and further analysis.
- Explore opportunities to improve customer engagement and loyalty program performance.

##  Dataset Description

The analysis uses three relational tables from the `dannys_diner` database.

| Table | Description | Key Columns |
|---|---|---|
| `sales` | Records customer purchases and transaction dates. | `customer_id`, `order_date`, `product_id` |
| `menu` | Contains menu items and their prices. | `product_id`, `product_name`, `price` |
| `members` | Records customers who joined the loyalty program and their joining dates. | `customer_id`, `join_date` |

### Entity Relationships

- `sales.product_id` links to `menu.product_id`.
- `sales.customer_id` links to `members.customer_id`.
- These relationships enable analysis of customer spending, product preferences, and membership activity.

##  Tools & Technologies

- **SQL** — Data querying and analysis
- **MySQL** — Database environment used for query execution
- **GitHub** — Version control and project documentation

##  Business Questions

The case study contains 10 core questions and 2 bonus challenges.

### 1. Customer Spending & Visit Patterns

1. What is the total amount spent by each customer?
2. How many days has each customer visited the restaurant?

### 2. Menu Preferences & Popularity

3. What was the first menu item purchased by each customer?
4. Which menu item was purchased the most across all customers, and how many times?
5. Which menu item was the most popular for each customer?

### 3. Loyalty Program Analysis

6. Which item did each customer purchase first after becoming a member?
7. Which item did each customer purchase just before becoming a member?
8. How many items did each member purchase, and how much did they spend before joining the program?
9. How many loyalty points did each customer earn under the standard points rules?
10. How many points did customers A and B earn by the end of January under the promotional points rules?

### 4. Bonus Challenges

**Join All The Things**
- Combine sales, menu, and membership data into a consolidated dataset.
- Identify membership status for each transaction.

**Rank All The Things**
- Rank each customer's purchases after they join the loyalty program.
- Preserve `NULL` ranking values for purchases made before membership.

##  SQL Concepts Practiced

- `SELECT`, `WHERE`, and `ORDER BY`
- Aggregate functions: `SUM()`, `COUNT()`, and `MIN()`
- `GROUP BY` and `HAVING`
- Table joins: `INNER JOIN` and `LEFT JOIN`
- Common Table Expressions (CTEs)
- Date-based filtering and comparisons
- Conditional logic using `CASE WHEN`
- Subqueries and intermediate result sets
- Window functions such as `RANK()` and `DENSE_RANK()`
- Business rule implementation through SQL calculations

##  Business Value

The analysis is designed to help answer practical business questions, including:

- Which customers contribute the most revenue?
- Which menu items drive the greatest demand?
- How do customer purchasing patterns change after joining the loyalty program?
- How can loyalty rewards be calculated consistently?
- How can transaction-level data be transformed into a reusable reporting dataset?

These insights can support customer segmentation, personalized promotions, menu planning, and loyalty program decisions.

##  Repository Structure

```text
dannys-diner-sql/
│
├── README.md
└── dannys_diner.sql
```

*The repository structure may be updated as additional SQL scripts and documentation are added.*

##  Key Findings

Based on the analysis of 15 customer transactions across 3 customers, the following findings were identified:

### 1. Customer Spending & Visit Patterns

- Customer A generated the highest total revenue of **$76**, closely followed by Customer B at **$74**.
- Customer B recorded the highest number of restaurant visits, with **6 unique visiting days**.
- Customer C had the lowest spending ($36) and the fewest visits (2 days).

### 2. Menu Item Performance

- **Ramen was the most purchased menu item**, with 8 purchases across all customers.
- Ramen was also the most popular item for Customers A and C.
- Customer B showed equal preference across all three menu items, with 2 purchases each.

### 3. Customer Loyalty & Membership Behaviour

- Customer A joined the loyalty program on January 7, 2021, while Customer B joined on January 9, 2021.
- Before joining the program, Customer A made 2 purchases worth $25, while Customer B made 3 purchases worth $40.
- Customer A's first purchase after joining was Curry, whereas Customer B's first purchase was Sushi.

### 4. Loyalty Points

- Under the standard loyalty points rules, customers earn double points on Sushi purchases.
- The promotional loyalty program provides double points on all menu items during the first seven days after membership.

## Business Recommendations & Actionable Insights

Based on the findings, the following recommendations could help Danny's Diner improve customer engagement, sales, and loyalty program effectiveness.

### 1. Focus on High-Value Customers

Customer A and Customer B contribute almost equally to restaurant revenue, with Customer A spending $76 and Customer B spending $74.

**Recommendation:**
- Introduce personalized rewards for frequent and high-spending customers.
- Offer exclusive deals to encourage repeat purchases.
- Monitor customer spending trends to identify high-value customer segments.

### 2. Leverage Popular Menu Items

Ramen accounts for 8 out of 15 purchases, making it the most frequently ordered item.

**Recommendation:**
- Prioritize Ramen in promotional campaigns.
- Ensure sufficient inventory to meet customer demand.
- Experiment with meal combinations featuring Ramen to encourage additional purchases.

### 3. Improve Customer Retention

Customer C has visited only twice and generated $36 in revenue, compared with Customers A and B.

**Recommendation:**
- Introduce targeted offers to encourage less frequent customers to revisit.
- Experiment with limited-period discounts or personalized promotions.
- Track repeat purchase frequency to evaluate campaign effectiveness.

### 4. Evaluate Loyalty Program Effectiveness

The loyalty program provides additional points to customers during their first week of membership.

**Recommendation:**
- Evaluate whether the additional points encourage customers to purchase more frequently.
- Track customer spending and visit frequency before and after membership.
- Consider personalized membership rewards based on individual purchasing preferences.

### 5. Introduce Personalized Marketing

Customers demonstrate different purchasing preferences. Customers A and C prefer Ramen, while Customer B purchases all three menu items equally.

**Recommendation:**
- Use purchase history to identify individual customer preferences.
- Create targeted promotions based on frequently purchased items.
- Experiment with cross-selling complementary menu items.

### Expected Business Impact

These recommendations could help Danny's Diner:

- Improve customer retention and repeat purchases.
- Increase average customer spending.
- Optimize menu promotions and inventory planning.
- Improve customer engagement through personalized offers.
- Make more informed decisions about the loyalty program.

*These are proposed business opportunities based on the sample dataset, not proven outcomes. Their effectiveness would need to be measured through further analysis and experimentation.*

##  Reference

This project is based on the original case study created by Danny Ma.

- **Case Study:** [Case Study #1 — Danny's Diner](https://8weeksqlchallenge.com/case-study-1/)
- **Challenge:** [8 Week SQL Challenge](https://8weeksqlchallenge.com/)

All case study context and dataset descriptions are credited to the original creator. The SQL queries in this repository are maintained as part of my personal learning and portfolio development.

---



