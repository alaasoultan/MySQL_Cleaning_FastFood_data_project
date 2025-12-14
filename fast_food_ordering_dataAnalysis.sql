select * 
from fast_food3 ;

select max(items_count)
from fast_food3 ;

select *, row_number() over() row_id
from fast_food3
where items_count >5 ;

select *, row_number() over() row_id
from fast_food3
where items_count >5 ;

select cuisine_type , sum(items_count) total_count ,count(order_id) total_orders, avg(delivery_time_minutes) avg_time, sum(order_value) total_cash
from fast_food3
group by cuisine_type
order by total_count desc;

select max(order_date) , min(order_date), max(order_time) , min(order_time)
from fast_food3 ;    # this dataset is among all months of 2025 year, and a 24/7 delivery

select * from 
fast_food3 ;

select  substring(order_date,1,7) `month`, sum(items_count) total_count ,count(order_id) total_orders, avg(delivery_time_minutes) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7)
order by `month` asc;

select  substring(order_date,1,7) `month`,cuisine_type, sum(items_count) total_count ,count(order_id) total_orders, avg(delivery_time_minutes) avg_time, round(sum(order_value), 2) total_cash
from fast_food3
group by  substring(order_date,1,7), cuisine_type
order by `month` asc;

select  substring(order_date,1,7) `month`, sum(items_count) total_count ,count(order_id) total_orders, avg(delivery_time_minutes) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7)
order by `month` asc;

select  substring(order_date,1,7) `month`,cuisine_type,city, sum(items_count) total_count ,count(order_id) total_orders, round(avg(delivery_time_minutes),2) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7),cuisine_type,city
order by `month`, cuisine_type, city asc;

with cte_1 as(
select  substring(order_date,1,7) `month`,cuisine_type,city, sum(items_count) total_count ,count(order_id) total_orders,
round(avg(delivery_time_minutes),2) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7),cuisine_type,city
order by `month`, cuisine_type, city asc
)
select * 
from cte_1
where total_orders =( select max(total_orders) from cte_1) ;

with cte_1 as(
select  substring(order_date,1,7) `month`,cuisine_type,city, sum(items_count) total_count ,count(order_id) total_orders,
round(avg(delivery_time_minutes),2) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7),cuisine_type,city
order by `month`, cuisine_type, city asc
)
select * 
from cte_1
where total_count =( select max(total_count) from cte_1) ;

with cte_1 as(
select  substring(order_date,1,7) `month`,cuisine_type,city, sum(items_count) total_count ,count(order_id) total_orders,
round(avg(delivery_time_minutes),2) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7),cuisine_type,city
order by `month`, cuisine_type, city asc
)
select * 
from cte_1
where total_cash =( select max(total_cash) from cte_1) ;

# months maximum order_count table
with cte_1 as(
select  substring(order_date,1,7) `month`,cuisine_type,city, sum(items_count) total_count ,count(order_id) total_orders,
round(avg(delivery_time_minutes),2) avg_time, round(sum(order_value) ,2) total_cash
from fast_food3
group by  substring(order_date,1,7),cuisine_type,city
order by `month`, cuisine_type, city asc
)
select *
from
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01') ) jan_max_table
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11') )
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12') )  
order by `month`
  ;
  
# months maximum order count for each cuisine type
with cte_1 as(
select  substring(order_date,1,7) `month`,cuisine_type,city, sum(items_count) total_count ,count(order_id) total_orders,
round(avg(delivery_time_minutes),2) avg_time, round(sum(order_value) ,2) total_cash , row_number() over() row_id
from fast_food3
group by  substring(order_date,1,7),cuisine_type,city
order by `month`, cuisine_type, city asc
)
select *
from
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'Healthy') ) jan_max_table
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-01' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-02' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-03' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-04' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-05' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-06' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-07' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-08' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-09' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-10' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-11' and cuisine_type= 'Italian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'Healthy') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'Fast Food') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'Mexican') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'North Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'Chinese') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'South Indian') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'Bakery') ) 
union
(select * 
from cte_1
where total_count =( select max(total_count) from cte_1 where `month`= '2025-12' and cuisine_type= 'Italian') ) 
order by `month`, cuisine_type
  ;

select distinct cuisine_type 
from fast_food3 ;

select * from fast_food3 ;

# time grouping + modes table

with city_mode as(
select *, '^_^' as `join1`
from fast_food3
where city = 
(
        SELECT city
        FROM fast_food3
        GROUP BY city
        ORDER BY COUNT(*) DESC
        LIMIT 1  )
),
cuisine_type_mode as(
select * , '^_^' as `join2`
from fast_food3
where cuisine_type =
(select cuisine_type from fast_food3
group by cuisine_type
order by count(*) desc
limit 1)
),
payment_method_mode as( 
select *, '^_^' as `join3` 
from fast_food3
where payment_method = 
(select payment_method from fast_food3
group by payment_method
order by count(*) desc
limit 1) 
)
select 
case
when fast_food3.order_time between '04:00:00' and '12:00:00' then 'Morning'
when fast_food3.order_time between '12:00:00' and '20:00:00' then 'Afternoon'
else 'Night'
end as time ,
max(city_mode.city),
max(cuisine_type_mode.cuisine_type),
max(payment_method_mode.payment_method),
sum(fast_food3.items_count),
sum(fast_food3.order_value)
from fast_food3 join city_mode 
on fast_food3.`join`= city_mode.join1
join cuisine_type_mode 
on city_mode.join1 = cuisine_type_mode.join2
join payment_method_mode
on payment_method_mode.join3 = cuisine_type_mode.join2
group by 
case
when fast_food3.order_time between '04:00:00' and '12:00:00' then 'Morning'
when fast_food3.order_time between '12:00:00' and '20:00:00' then 'Afternoon'
else 'Night'
end
 ;

# time grouping + modes table END .
 
 alter table fast_food3
 add column `join` varchar(5) ;
 
 update  fast_food3
 set `join` = '^_^' ;
 
 select *
 from fast_food3 ;
 
 
 with cte_1 ( cuisine_type, city, orders_value, items_count )as(
 select cuisine_type, city, round(sum(order_value),2), sum(items_count)
 from fast_food3
 group by cuisine_type, city
 order by sum(items_count)
 ),
 cte_2 as(
 select * , dense_rank() over(partition by cuisine_type order by items_count desc) ranking
 from cte_1
 )
 select *
 from cte_2 
 where ranking <=5 and cuisine_type = "healthy" ;
 
 # Mode Query
 with cte_1 as(
 select city, payment_method, dense_rank() over(partition by city order by payment_method ) ranking
 from fast_food3
 ), cte_2 as(
 select *,  row_number()over(partition by ranking) pay_method_count
 from cte_1
 )
 select city, payment_method, max(pay_method_count) payment_mode_value
 from cte_2 
 group by city, payment_method
 having city = 'Pune' 
 order by payment_mode_value desc
 limit 1
 ;
 
 select distinct city
 from fast_food3 ;
 