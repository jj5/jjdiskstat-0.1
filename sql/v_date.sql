create view v_date as
select
  a_date,
  count(*) as a_count
from
  t_clean
group by
  a_date
order by
  a_date desc;
