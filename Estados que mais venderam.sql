
select 
	'Brazil' as país,
	cus.state as estado,
	count(fun.paid_date) as "vendas (#)"
	

from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id= cus.customer_id
where paid_date between '2021-08-01' and '2021-08-31'
group by país, estado
order by "vendas (#)" desc
limit 5