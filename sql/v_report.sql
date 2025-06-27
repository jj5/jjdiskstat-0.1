create view v_report as
select
  a_model,
  count(*) as a_count,
  sum(a_failure) as a_failure_count,
  ( sum(a_failure) / count(*) ) * 10000 as a_failure_ratio
from
  t_clean
group by
  a_model
order by
  4 desc;
