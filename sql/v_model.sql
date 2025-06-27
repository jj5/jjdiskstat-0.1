create view v_model as
select
  a_model,
  count(*) as a_count
from
  t_clean
group by
  a_model
order by
  2 desc;
