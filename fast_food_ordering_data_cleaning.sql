# phase1; DATA CLEANING

# - Identifying and removing duplicates
# - Dealing with the null values (dropping or replacing them)
# - standerdizing the data values
# - dropping the unnecessary /extra columns 

# *REMOVING DUPLICATES*

select * from fast_food_ordering_dataset ;

select * from fast_food_ordering2 ;

insert into fast_food_ordering2
select *
from fast_food_ordering_dataset ;

with cte_1 as(
select * , row_number() over(partition by order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes,
 payment_method, items_count) row_num
from fast_food_ordering2
 )
 select * from cte_1
 where row_num > 1 ;
 
 alter table fast_food_ordering2
 add column row_num3 int ;
 
 insert  into fast_food_ordering2  ( row_num3)
 select row_number() over(partition by order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes,
 payment_method, items_count) as row_num
 from fast_food_ordering_dataset ;
 
 drop table fast_food3 ;
 
 CREATE TABLE `fast_food3` (
  `order_id` text,
  `order_time` datetime DEFAULT NULL,
  `city` text,
  `cuisine_type` text,
  `order_value` double DEFAULT NULL,
  `delivery_time_minutes` int DEFAULT NULL,
  `payment_method` text,
  `items_count` int DEFAULT NULL,
  row_count int 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

 insert into fast_food3
 select * , row_number() over(partition by order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes, payment_method, items_count)
 from fast_food_ordering_dataset ;
 
 select *
 from fast_food3 ;
 
 insert into fast_food3( order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes, payment_method,items_count)
 values('ORD100002','2025-12-20 18:46:00','Chennai','Fast Food',440.48,30,'Credit Card',4) ;

 select *
 from fast_food3 
 where `row_count` > 1;
 
 with cte_1 as (
 select * , row_number() over(partition by order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes, payment_method, items_count) flag
 from fast_food3
 )
 select * 
 from cte_1
 where flag >1 ;
 
 alter table fast_food3
 add column flag int ;
 
 alter table fast_food_ordering2
 drop column row_num ;
 
 alter table fast_food_ordering2
 drop column row_num2 ;
 
alter table fast_food_ordering2
 drop column row_num3 ;
 
 alter table fast_food3
 drop column `row_count` ;
 
 select *
 from fast_food3 ;
 
 insert into fast_food3 (order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes, payment_method, items_count, flag)
 select order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes, payment_method, items_count,
 row_number() over(partition by order_id, order_time, city, cuisine_type, order_value, delivery_time_minutes, payment_method, items_count)
 from fast_food3 ;
 
 select * 
 from fast_food3
 where flag> 1 ;
 
 delete 
 from fast_food3  
 where flag > 1 ;
 
 # * STANDERDIZING DATA *
 
 select * from fast_food3 ;
 
 select * , substring(order_id, 4, 6) 
 from fast_food3 ; 
 
 update fast_food3
 set order_id = substring(order_id, 4, 6) ;
 
 delete from fast_food3
 where flag is null ;
 
 alter table fast_food3
 add column order_time time ;
 
 insert into fast_food3 (order_time)
 select substring(order_date,12,8)
 from fast_food3 ;
 
 delete from fast_food3 
 where order_time is not null ;
 
 select *
 from fast_food3 ;
 
 update fast_food3
 set order_time = substring(order_date,12,8) ;
 
 update fast_food3
 set order_date = substring(order_date,1,10) ;
 
 select distinct city
 from fast_food3 ;
 
 select distinct cuisine_type 
 from fast_food3 ;
 
 select distinct payment_method 
 from fast_food3 ;
 
 select *
 from fast_food3 ;
 
 alter table fast_food3
 drop column flag ;
 
 # phase2; DATA ANALYSIS
 