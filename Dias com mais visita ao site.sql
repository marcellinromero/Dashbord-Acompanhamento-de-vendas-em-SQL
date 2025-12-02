select 
	extract('dow'from visit_page_date) as dia_semana,
	case 
		when extract('dow'from visit_page_date) = 0 then 'domingo'
		when extract('dow'from visit_page_date) = 1 then 'segunda'
		when extract('dow'from visit_page_date) = 2 then 'terça'
		when extract('dow'from visit_page_date) = 3 then 'quarta'
		when extract('dow'from visit_page_date) = 4 then 'quinta'
		when extract('dow'from visit_page_date) = 5 then 'sexta'
		when extract('dow'from visit_page_date) = 6 then 'sábado'
		else null end as "dia da semana",
	count(*) as "visitas (#)"


from sales.funnel 
where visit_page_date between '2021-08-01' and '2021-08-31'
group by dia_semana
order by dia_semana