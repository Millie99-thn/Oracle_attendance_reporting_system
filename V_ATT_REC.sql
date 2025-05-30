CREATE OR REPLACE VIEW V_ATT_REC AS
(
select a2.emp_id,
a2.emp_name,
a2.work_date,
a2.first_in,
a2.lunch_out,
a2.lunch_in,
a2.last_out,
a2.transition,
a3.vio_count,
floor((a2.transition - a3.vio_count)/2) pair
from
(select
vrec.emp_id, vrec.emp_name, vrec.work_date ,
MAX(aaa.work_in) first_in,
max(vrec.lunch_out) lunch_out,
MAX(vrec.lunch_in) lunch_in,
max(vrec.last_out) last_out,
max(vrec.rn) transition
 from

 v_att_all vrec
 join
 (
select
aa.emp_id,
aa.emp_name,
aa.work_date,
max(case
  when aa.first_in is not null then aa.first_in
  else aa.first_in2 end  ) work_in
from
(
select * from v_att_all) aa
group by aa.emp_id, aa.emp_name, aa.work_date) aaa on aaa.emp_id = vrec.emp_id and aaa.work_date = vrec.work_date
 where 1=1
 group by vrec.emp_id, vrec.emp_name, vrec.work_date) a2

 left join (
 WITH ranked_rows AS (
    SELECT
        va.emp_id,
        va.emp_name,
        va.work_date,
        va.detection,
        ROW_NUMBER() OVER (PARTITION BY va.emp_id, va.work_date ORDER BY va.time_part) AS rn_vio
    FROM v_att_all va
    WHERE va.detection = 'vio'
)
SELECT
    r.emp_id,
    r.emp_name,
    r.work_date,
    COUNT(*) AS vio_count
FROM ranked_rows r
GROUP BY r.emp_id, r.emp_name, r.work_date
ORDER BY r.emp_id, r.work_date ) a3 on a2.emp_id = a3.emp_id and a2.work_date = a3.work_date);
