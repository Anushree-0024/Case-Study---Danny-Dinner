#What is the total amount each customer spent at the restaurant?
SELECT s.customer_id ,sum(price) as total_spent 
FROM sales s
LEFT JOIN menu m
ON s.product_id = m.product_id
GROUP BY s.customer_id

##

#How many days has each customer visited the restaurant?
with cte1 as (SELECT customer_id,order_date
FROM sales
GROUP BY customer_id,order_date) 
SELECT DISTINCT(customer_id) as visited_customer, count(order_date) as no_of_days_visited
FROM cte1
GROUP BY customer_id

##

#What was the first item from the menu purchased by each customer?
with cte1 as (SELECT customer_id,product_id, ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) as sequence
FROM sales)
SELECT customer_id, product_name 
FROM cte1 c1
LEFT JOIN menu m
ON c1.product_id=m.product_id
WHERE c1.sequence

##

#What is the most purchased item on the menu and how many times was it purchased by all customers?
with cte1 as (
SELECT product_id,count(product_id) as no_of_times
FROM sales
GROUP BY product_id
),
cte2 as (SELECT product_id ,no_of_times
,RANK() OVER(ORDER BY no_of_times DESC) as rnk
FROM cte1)
SELECT m.product_name , no_of_times_purchased
FROM cte2 c
LEFT JOIN menu m
ON c.product_id=m.product_id
WHERE cte2.rnk= 1

##

#Which item was the most popular for each customer?
with cte1 as (
SELECT customer_id, product_id,count(product_id) as cnt
FROM sales
GROUP BY customer_id,product_id),
cte2 as (SELECT customer_id,product_id,cnt,
RANK() OVER(PARTITION BY customer_id ORDER BY cnt DESC) as rnk
FROM cte1)
SELECT c.customer_id,m.product_name
FROM cte2 c
LEFT join menu m
ON c.product_id=m.product_id
WHERE rnk=1

##

#Which item was purchased first by the customer after they became a member?
with cte1 as (SELECT m.customer_id,s.product_id
FROM members m
LEFT JOIN sales s
ON 
 m.join_date < s.order_date)
SELECT c1.customer_id, me.product_name
FROM cte1 c1
LEFT JOIN menu me
ON c1.product_id=me.product_id

##

#Which item was purchased just before the customer became a member?
WITH cte AS (
    SELECT 
        s.customer_id,
        s.product_id,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id  ORDER BY s.order_date) AS rn
    FROM sales s
    JOIN members m
        ON s.customer_id = m.customer_id
    WHERE s.order_date > m.join_date
)
SELECT 
    c.customer_id,
    m.product_name
FROM cte c
JOIN menu m
    ON c.product_id = m.product_id
WHERE c.rn = 1;

##

#What is the total items and amount spent for each member before they became a member?
WITH cte AS (
    SELECT 
        s.customer_id,
        s.product_id
    FROM sales s
    JOIN members m
        ON s.customer_id = m.customer_id
    WHERE s.order_date < m.join_date 
)
SELECT c.customer_id ,count(c.product_id),sum(m.price)
FROM cte c
LEFT JOIN menu m
ON c.product_id=m.product_id
GROUP BY c.customer_id;

##

#If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
WITH cte as (SELECT s.customer_id,m.product_name,m.price,
CASE WHEN m.product_name = 'sushi' then m.price * 20 else m.price*10 end as points 
FROM sales s
LEFT JOIN menu m
ON s.product_id=m.product_id)
SELECT customer_id , sum(points) as total_points 
FROM cte 
GROUP BY customer_id ;

##

#In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
WITH cte1 AS (
    SELECT 
        s.customer_id,
        s.product_id,
        s.order_date,
        m.join_date
    FROM sales s
    LEFT JOIN members m
        ON s.customer_id = m.customer_id
    WHERE s.order_date >= m.join_date
      AND s.order_date <= m.join_date + 6
),
cte2 AS (
    SELECT 
        c1.customer_id,
        c1.product_id,
        me.price * 20 AS points
    FROM cte1 c1
    LEFT JOIN menu me
        ON c1.product_id = me.product_id
)
SELECT 
    customer_id,
    SUM(points) AS total_points
FROM cte2
GROUP BY customer_id;

##

#BONUS QUESTION

#The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without needing to join the underlying tables using SQL.
SELECT s.customer_id,s.order_date,me.product_name,me.price,
CASE WHEN s.customer_id = m.customer_id THEN 'Y' ELSE 'N' END AS member
FROM sales s
LEFT JOIN menu me
ON s.product_id=me.product_id
LEFT JOIN members m
ON s.customer_id=m.customer_id ;

#Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.
SELECT
    s.customer_id,
    s.order_date,
    me.product_name,
    me.price,
    CASE
        WHEN s.order_date >= m.join_date THEN 'Y'
        WHEN m.join_date IS NOT NULL THEN 'N'
        ELSE 'N'
    END AS member,
    CASE
        WHEN s.order_date >= m.join_date THEN
            RANK() OVER (
                PARTITION BY s.customer_id
                ORDER BY
                    CASE
                        WHEN s.order_date >= m.join_date THEN s.order_date
                    END
            )
        ELSE NULL
    END AS ranking
FROM sales s
LEFT JOIN menu me
    ON s.product_id = me.product_id
LEFT JOIN members m
    ON s.customer_id = m.customer_id
ORDER BY s.customer_id, s.order_date;







