create view v_failure as
select
  a_failure,
  count(*) as a_count
from
  t_clean
group by
  a_failure
order by
  2 desc;
