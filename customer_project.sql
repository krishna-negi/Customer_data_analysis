
select gender,sum(purchase_amount) as revenue from customer group by gender;

select customer_id  from customer where discount_applied='Yes' and  purchase_amount>=(select avg(purchase_amount)from customer);

select item_purchased , round(avg(review_rating::numeric),2) as rr from customer group by item_purchased  order by avg(review_rating) desc  limit 5;

select shipping_type,round(avg(purchase_Amount)::numeric,2) from customer where shipping_type in ('Express','Standard') group by shipping_type;

select subscription_Status, count(customer_id) as total_customers ,round(avg(purchase_amount),2) as avg_spend,
sum(purchase_amount) as total_revenue from customer group by subscription_Status
order by total_revenue,avg_spend ; 

select item_purchased,100* sum(case when discount_applied='Yes' then 1 else 0 end)/count(*)  as discount_rate from customer group by  item_purchased 
order by discount_rate desc limit 5;


with customer_type as(select customer_id,previous_purchases,
 case when previous_purchases=1 then 'new' 
when previous_purchases between 2 and 10 then 'Returing'
else 'loyal'
end as customer_Segment from customer )select customer_Segment ,count(*) as "no. of customers" from  customer_type
group by  customer_Segment;

select * from customer limit 5;

with customer_table as (select count(customer_id) as cust,item_purchased,category 
,row_number() over(partition by category order by count(customer_id)  desc) as items  from customer    group by item_purchased,category
) select item_purchased,category,items from customer_table where items<=3; 

select subscription_Status,count(customer_id) from customer where previous_purchases>=5  group by subscription_Status  ;

select age_grouped, sum(purchase_amount) as revenue from customer group by  age_grouped order by revenue desc ;









