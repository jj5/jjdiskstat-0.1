create view v_year as
select
  year(a_date) as a_year,
  count(*) as a_count
from
  t_clean
group by
  year(a_date)
order by
  1 desc;
