CREATE OR REPLACE VIEW V_ATT_STATUS AS
SELECT
v.emp_id,
v.emp_name,
v.work_date,
v.FIRST_IN,
v.LUNCH_OUT,
v.LUNCH_IN,
v.LAST_OUT,
v.TRANSITION,
v.vio_count,
v.pair,
case
  when to_date(v.FIRST_IN,'HH24:MI:SS') <= to_date(c1.start_time,'HH24:MI:SS') + interval '1' minute then 'normal'
  when to_date(v.FIRST_IN,'HH24:MI:SS') > to_date(c1.start_time,'HH24:MI:SS') + interval '1' minute then
    case
      when
       (to_date(v.FIRST_IN,'HH24:MI:SS') - to_date(c1.start_time,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
      when
       (to_date(v.FIRST_IN,'HH24:MI:SS') - to_date(c1.start_time,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
       else '...' end
  else '...' end checkpoint1 ,

case
  when v.LUNCH_OUT is not null then
    case
      when
        to_date(v.LUNCH_OUT,'HH24:MI:SS') >= to_date(c1.end_time,'HH24:MI:SS') then 'normal'
      when
        to_date(v.LUNCH_OUT,'HH24:MI:SS') < to_date(c1.end_time,'HH24:MI:SS') then
            case when (to_date(c1.end_time,'HH24:MI:SS') - to_date(v.LUNCH_OUT,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
                 when (to_date(c1.end_time,'HH24:MI:SS') - to_date(v.LUNCH_OUT,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
      else '...' end
    else '...' end
  when v.lunch_out is null and v.last_out is not null and c.day_of_week <> 'SAT' then
      case
       when
         to_date(v.last_out,'HH24:MI:SS') >= to_date(c1.end_time,'HH24:MI:SS')
         and to_date(v.last_out,'HH24:MI:SS') < to_date(c2.start_time,'HH24:MI:SS')then 'normal'
       when
         to_date(v.last_out,'HH24:MI:SS') < to_date(c1.end_time,'HH24:MI:SS') then
            case when (to_date(c1.end_time,'HH24:MI:SS') - to_date(v.last_out,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when (to_date(c1.end_time,'HH24:MI:SS') - to_date(v.last_out,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
    else '...' end
  when v.lunch_out is null and v.last_out is not null and c.day_of_week = 'SAT' then
      case
       when
         to_date(v.last_out,'HH24:MI:SS') >= to_date(c1.end_time,'HH24:MI:SS') then 'normal'
       when
         to_date(v.last_out,'HH24:MI:SS') < to_date(c1.end_time,'HH24:MI:SS') then
            case when (to_date(c1.end_time,'HH24:MI:SS') - to_date(v.last_out,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when (to_date(c1.end_time,'HH24:MI:SS') - to_date(v.last_out,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
    else '...' end
else '...' end checkpoint2,

case
  when a.remark is null and v.LUNCH_IN is not null then
    case
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') between to_date(c1.end_time,'HH24:MI:SS')
        and to_date(c2.start_time,'HH24:MI:SS') then 'normal'
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') > to_date(c2.start_time,'HH24:MI:SS')  then
            case
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - to_date(c2.start_time,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - to_date(c2.start_time,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
    else '...' end
  when a.remark = 'C' and v.LUNCH_IN is not null then
    case
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') <= to_date(c2.start_time,'HH24:MI:SS') + interval '30' minute then 'normal'
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') > to_date(c2.start_time,'HH24:MI:SS') + interval '30' minute then
            case
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - (to_date(c2.start_time,'HH24:MI:SS')+ interval '30' minute))*24*60 <= 30 then '0.5H'
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - (to_date(c2.start_time,'HH24:MI:SS')+ interval '30' minute))*24*60 between 30 and 120 then '2H'
            else '...' end
    else '...' end
   when a.remark = 'CC' and v.LUNCH_IN is not null then
    case
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') between to_date(c1.end_time,'HH24:MI:SS')
        and to_date(c2.start_time,'HH24:MI:SS') then 'normal'
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') > to_date(c2.start_time,'HH24:MI:SS')  then
            case
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - to_date(c2.start_time,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - to_date(c2.start_time,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
    else '...' end
   when a.remark = 'OS' or a.remark = 'P' and v.LUNCH_IN is not null then
    case
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') between to_date(c1.end_time,'HH24:MI:SS')
        and to_date(c2.start_time,'HH24:MI:SS') then 'normal'
      when
        to_date(v.LUNCH_IN,'HH24:MI:SS') > to_date(c2.start_time,'HH24:MI:SS')  then
            case
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - to_date(c2.start_time,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when (to_date(v.LUNCH_IN,'HH24:MI:SS') - to_date(c2.start_time,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
    else '...' end
else '...' end checkpoint3,

case
  when a.remark is null then
    Case
       when to_date(v.LAST_OUT,'HH24:MI:SS') >= to_date(c2.end_time,'HH24:MI:SS') then 'normal'
       when to_date(v.LAST_OUT,'HH24:MI:SS') < to_date(c2.end_time,'HH24:MI:SS') and c.day_of_week <> 'SAT' then
            case
              when
              (to_date(c2.end_time,'HH24:MI:SS') - to_date(v.LAST_OUT,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when
              (to_date(c2.end_time,'HH24:MI:SS') - to_date(v.LAST_OUT,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
     else '...' end
  when a.remark = 'C' then
    Case
       when to_date(v.LAST_OUT,'HH24:MI:SS') >= to_date(c2.end_time,'HH24:MI:SS') + interval '30' minute then 'normal'
       when to_date(v.LAST_OUT,'HH24:MI:SS') < to_date(c2.end_time,'HH24:MI:SS') + interval '30' minute then
            case
              when
              (to_date(c2.end_time,'HH24:MI:SS') - (to_date(v.LAST_OUT,'HH24:MI:SS') + interval '30' minute))*24*60 <= 30 then '0.5H'
              when
              (to_date(c2.end_time,'HH24:MI:SS') - (to_date(v.LAST_OUT,'HH24:MI:SS')+ interval '30' minute))*24*60 between 30 and 120 then '2H'
            else '...' end
     else '...' end
  when a.remark = 'CC' then
    Case
       when to_date(v.LAST_OUT,'HH24:MI:SS') >= to_date(c2.end_time,'HH24:MI:SS') then 'normal'
       when to_date(v.LAST_OUT,'HH24:MI:SS') < to_date(c2.end_time,'HH24:MI:SS') and c.day_of_week <> 'SAT' then
            case
              when
              (to_date(c2.end_time,'HH24:MI:SS') - to_date(v.LAST_OUT,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when
              (to_date(c2.end_time,'HH24:MI:SS') - to_date(v.LAST_OUT,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
     else '...' end
  when a.remark = 'OS' or a.remark = 'P' then
    Case
       when to_date(v.LAST_OUT,'HH24:MI:SS') >= to_date(c2.end_time,'HH24:MI:SS') then 'normal'
       when to_date(v.LAST_OUT,'HH24:MI:SS') < to_date(c2.end_time,'HH24:MI:SS') and c.day_of_week <> 'SAT' then
            case
              when
              (to_date(c2.end_time,'HH24:MI:SS') - to_date(v.LAST_OUT,'HH24:MI:SS'))*24*60 <= 30 then '0.5H'
              when
              (to_date(c2.end_time,'HH24:MI:SS') - to_date(v.LAST_OUT,'HH24:MI:SS'))*24*60 between 30 and 120 then '2H'
            else '...' end
     else '...' end
  else '...' end checkpoint4
from v_att_rec v
left join att_emp a on v.emp_id = a.emp_code
join calendar c on v.work_date = c.calendar_date
join checkpoints c1 on c1.name = 'working_am'
join checkpoints c2 on c2.name = 'working_pm';
