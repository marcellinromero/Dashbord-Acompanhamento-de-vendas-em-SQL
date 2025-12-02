select 
	sto.store_name as loja,
	count(fun.paid_date) as "vendas(#)"

from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
where paid_date between '2021-08-01' and '2021-08-31' 
group by loja
order by "vendas(#)" desc
limit 5