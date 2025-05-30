create or replace view v_att_overall as
select c.calendar_date,
       c.day_of_week,
       c.is_weekend,
       c.is_holiday,
       a.emp_code,
       a.name,
       a.dept,
       a.real_code,
       a.remark,
       vs.FIRST_IN,
       vs.LUNCH_OUT,
       vs.LUNCH_IN,
       vs.LAST_OUT,
       vs.TRANSITION,
       vs.vio_count,
       vs.pair,
       vs.checkpoint1,
       vs.checkpoint2,
       vs.checkpoint3,
       vs.checkpoint4,
       vs.normal_count,
       vs.late_point5h,
       vs.late_2h,
       vs.no_scan,
       vs.Remark status
from calendar c
join att_emp a on a.remark is null
left join v_att_summary vs on c.calendar_date = vs.WORK_DATE and a.emp_code = vs.EMP_ID
where 1 = 1
and c.calendar_date between date'2025-03-01' and date'2025-03-24'
and a.emp_code is not null

union all


select c1.calendar_date,
       c1.day_of_week,
       c1.is_weekend,
       c1.is_holiday,
       a1.emp_code,
       a1.name,
       a1.dept,
       a1.real_code,
       a1.remark,
       vs1.FIRST_IN,
       vs1.LUNCH_OUT,
       vs1.LUNCH_IN,
       vs1.LAST_OUT,
       vs1.TRANSITION,
       vs1.vio_count,
       vs1.pair,
       vs1.checkpoint1,
       vs1.checkpoint2,
       vs1.checkpoint3,
       vs1.checkpoint4,
       vs1.normal_count,
       vs1.late_point5h,
       vs1.late_2h,
       vs1.no_scan,
       vs1.Remark status
from calendar c1
join att_emp a1 on a1.remark = 'C'
left join v_att_summary vs1 on c1.calendar_date = vs1.WORK_DATE and a1.emp_code = vs1.EMP_ID
where 1 = 1
and c1.calendar_date between date'2025-03-01' and date'2025-03-24'
and a1.emp_code is not null

union all

select c2.calendar_date,
       c2.day_of_week,
       c2.is_weekend,
       c2.is_holiday,
       a2.emp_code,
       a2.name,
       a2.dept,
       a2.real_code,
       a2.remark,
       vs2.FIRST_IN,
       vs2.LUNCH_OUT,
       vs2.LUNCH_IN,
       vs2.LAST_OUT,
       vs2.TRANSITION,
       vs2.vio_count,
       vs2.pair,
       vs2.checkpoint1,
       vs2.checkpoint2,
       vs2.checkpoint3,
       vs2.checkpoint4,
       vs2.normal_count,
       vs2.late_point5h,
       vs2.late_2h,
       vs2.no_scan,
       vs2.Remark status
from calendar c2
left join att_emp a2 on a2.remark = 'S'
left join v_att_summary_shift vs2 on c2.calendar_date = vs2.WORK_DATE and a2.emp_code = vs2.EMP_ID
where 1 = 1
and c2.calendar_date between date'2025-03-01' and date'2025-03-24'
and a2.emp_code is not null

union all

select c3.calendar_date,
       c3.day_of_week,
       c3.is_weekend,
       c3.is_holiday,
       a3.emp_code,
       a3.name,
       a3.dept,
       a3.real_code,
       a3.remark,
       vs3.FIRST_IN,
       vs3.LUNCH_OUT,
       vs3.LUNCH_IN,
       vs3.LAST_OUT,
       vs3.TRANSITION,
       vs3.vio_count,
       vs3.pair,
       vs3.checkpoint1,
       vs3.checkpoint2,
       vs3.checkpoint3,
       vs3.checkpoint4,
       vs3.normal_count,
       vs3.late_point5h,
       vs3.late_2h,
       vs3.no_scan,
       vs3.Remark status
from calendar c3
join att_emp a3 on a3.remark = 'N'
left join v_att_summary_noc vs3 on c3.calendar_date = vs3.WORK_DATE and a3.emp_code = vs3.EMP_ID
where 1 = 1
and c3.calendar_date between date'2025-03-01' and date'2025-03-24'
and a3.emp_code is not null

union all

select c4.calendar_date,
       c4.day_of_week,
       c4.is_weekend,
       c4.is_holiday,
       a4.emp_code,
       a4.name,
       a4.dept,
       a4.real_code,
       a4.remark,
       vs4.FIRST_IN,
       vs4.LUNCH_OUT,
       vs4.LUNCH_IN,
       vs4.LAST_OUT,
       vs4.TRANSITION,
       vs4.vio_count,
       vs4.pair,
       vs4.checkpoint1,
       vs4.checkpoint2,
       vs4.checkpoint3,
       vs4.checkpoint4,
       vs4.normal_count,
       vs4.late_point5h,
       vs4.late_2h,
       vs4.no_scan,
       vs4.Remark status
from calendar c4
join att_emp a4 on a4.remark = 'CC'
left join v_att_summary_cc vs4 on c4.calendar_date = vs4.WORK_DATE and a4.emp_code = vs4.EMP_ID
where 1 = 1
and c4.calendar_date between date'2025-03-01' and date'2025-03-24'
and a4.emp_code is not null

union all

select c5.calendar_date,
       c5.day_of_week,
       c5.is_weekend,
       c5.is_holiday,
       a5.emp_code,
       a5.name,
       a5.dept,
       a5.real_code,
       a5.remark,
       vs5.FIRST_IN,
       vs5.LUNCH_OUT,
       vs5.LUNCH_IN,
       vs5.LAST_OUT,
       vs5.TRANSITION,
       vs5.vio_count,
       vs5.pair,
       vs5.checkpoint1,
       vs5.checkpoint2,
       vs5.checkpoint3,
       vs5.checkpoint4,
       vs5.normal_count,
       vs5.late_point5h,
       vs5.late_2h,
       vs5.no_scan,
       vs5.Remark status
from calendar c5
join att_emp a5 on a5.remark = 'OS'
left join v_att_summary_os vs5 on c5.calendar_date = vs5.WORK_DATE and a5.emp_code = vs5.EMP_ID
where 1 = 1
and c5.calendar_date between date'2025-03-01' and date'2025-03-24'
and a5.emp_code is not null

union all

select c6.calendar_date,
       c6.day_of_week,
       c6.is_weekend,
       c6.is_holiday,
       a6.emp_code,
       a6.name,
       a6.dept,
       a6.real_code,
       a6.remark,
       vs6.FIRST_IN,
       vs6.LUNCH_OUT,
       vs6.LUNCH_IN,
       vs6.LAST_OUT,
       vs6.TRANSITION,
       vs6.vio_count,
       vs6.pair,
       vs6.checkpoint1,
       vs6.checkpoint2,
       vs6.checkpoint3,
       vs6.checkpoint4,
       vs6.normal_count,
       vs6.late_point5h,
       vs6.late_2h,
       vs6.no_scan,
       vs6.Remark status
from calendar c6
join att_emp a6 on a6.remark = 'P'
left join v_att_summary_p vs6 on c6.calendar_date = vs6.WORK_DATE and a6.emp_code = vs6.EMP_ID
where 1 = 1
and c6.calendar_date between date'2025-03-01' and date'2025-03-24'
and a6.emp_code is not null


order by calendar_date,emp_code;
