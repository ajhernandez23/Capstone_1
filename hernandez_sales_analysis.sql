-- What is total revenue overall for sales in the assigned territory, 
-- plus the start date and end date that tell you what period the data covers? 

select *
from online_sales
where ShiptoState = 'Massachusetts'
; -- 6553 rows 

select ShiptoState, sum(SalesTotal) as total_rev_online
from online_sales
group by ShiptoState
having ShiptoState = 'Massachusetts'
;

select ShiptoState, sum(SalesTotal) as total_rev_online, Date
from online_sales
group by ShiptoState, Date
having ShiptoState = 'Massachusetts'
order by Date asc
;

select State, sum(Sale_Amount) as total_rev_store, Transaction_Date
from store_sales join store_locations
	on store_sales.Store_ID = store_locations.StoreId
group by State, Transaction_Date
having State = 'Massachusetts'
order by Transaction_Date asc
;

-- What is the revenue breakdown by year and month for the sales territory? 

select State,  month(Transaction_Date) as Month, year(Transaction_Date) as Year, sum(Sale_Amount) as Sales_Rev_Store
from store_sales join store_locations
	on store_sales.Store_ID = store_locations.StoreId
group by State, Transaction_Date
having State = 'Massachusetts'
;

select ShiptoState, month(Date) as Month, year(Date) as year, sum(SalesTotal) as Sales_Rev_Online
from online_sales
where ShiptoState = 'Massachusetts'
group by ShiptoState, Date
;

-- Provide a comparison of total revenue for the specific sales territory and the region it belongs to. 

select State,  month(Transaction_Date) as Month, year(Transaction_Date) as Year, sum(Sale_Amount) as Sales_Rev_Store
from store_sales join store_locations
	on store_sales.Store_ID = store_locations.StoreId
group by State, Transaction_Date
having State in ('Massachusetts','Maine','Maryland','New Jersey')
order by State
;

select ShiptoState, month(Date) as Month, year(Date) as year, sum(SalesTotal) as Sales_Rev_Online
from online_sales
group by ShiptoState, Date
having ShiptoState in ('Massachusetts','Maine','Maryland','New Jersey')
order by ShiptoState
;

-- What is the number of transactions per month and average transaction amount by product category for the sales territory? 

select State, Categoryid, Product,month(Transaction_Date), count(Transaction_Date)
from store_sales join store_locations join products
	on products.ProdNum = store_sales.Prod_Num and store_sales.Store_ID = store_locations.StoreId
group by State, Categoryid, Transaction_Date, Product
having State = 'Massachusetts'
order by Categoryid, month(Transaction_Date)
;

select State,Categoryid, avg(Sale_Amount) as Avg_Store_Sale
from store_sales join store_locations join products
	on products.ProdNum = store_sales.Prod_Num and store_sales.Store_ID = store_locations.StoreId
group by State, Categoryid
having state = 'Massachusetts'
order by Categoryid
;

select ShiptoState, Categoryid, Product, month(Date), count(Date)
from online_sales join products
	on products.ProdNum = online_sales.ProdNum 
group by ShiptoState, Categoryid, Product, month(Date)
having ShiptoState = 'Massachusetts'
order by Categoryid, month(Date)
;

-- Can you provide a ranking of online sales performance by state within an online sales territory? 

select ShiptoState, sum(SalesTotal) as Total_Online_Sales
from online_sales
group by ShiptoState
order by 2 desc 
;











    
    
    
    
    