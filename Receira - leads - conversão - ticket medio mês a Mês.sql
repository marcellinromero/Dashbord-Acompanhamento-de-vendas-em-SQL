with leads as(
	select
		date_trunc('month', visit_page_date)::date as visit_page_month,
		count(*) as visit_page_count



	from sales.funnel
	group by visit_page_month
	order by visit_page_month
),
 payment as
	(select 
		 date_trunc('month', fun.paid_date)::date as paid_month,
		count(*) as paid_count,
		sum(pro.price * (1+fun.discount)) as receita
	from sales.funnel as fun
	left join sales.products as pro
		on fun.product_id = pro.product_id
	where fun.paid_date is not null
	group by paid_month
	order by paid_month
)


select 
	leads.visit_page_month as "Mês",
	leads.visit_page_count as "leads (#)",
	payment.paid_count as "Vendas (#)",
	(payment.receita/1000) as "Recita(k, R$)",
	(payment.paid_count::float/leads.visit_page_count::float) as "Conversão(%)",
	(payment.receita/payment.paid_count/1000) as "Ticket Médio (k, R$)"
from leads
left join payment
	on leads.visit_page_month = payment.paid_month