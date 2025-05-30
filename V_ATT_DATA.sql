CREATE OR REPLACE VIEW V_ATT_DATA AS
(
select
 d.id,
 d.event_date,
 TO_char(d.event_date , 'YYYY/MM/DD') date_part,
 TO_char(d.event_date , 'HH24:MI:SS') time_part,
 d.event,
 d.emp_id,
 d.emp_name,
 d.card_number,
 d.department,
  row_number() over (partition by d.date_part,d.emp_id order by d.event_date , d.emp_id) row_number
 from
 (
 select c.*,
 row_number() over (partition by c.date_part order by c.event_date) row_number
  from
 (
 select *
 from eg_att e
 left join (
  SELECT b.rowid row_id

  FROM (SELECT a.rowid,
               a.Emp_id employee_id,
               a.emp_name employee_name,
               a.event_date timestamp,
               trunc(a.event_date) date_part,
               a.event event,
               a.id scan_id,
               ROW_NUMBER() OVER(PARTITION BY a.Emp_id ORDER BY a.event_date) AS rn,
               LAG(a.event_date) OVER(PARTITION BY a.Emp_id ORDER BY a.event_date) AS prev_timestamp,
               LAG(a.event) OVER(PARTITION BY a.Emp_id ORDER BY a.event_date) AS prev_event,
               LAG(a.date_part) OVER(PARTITION BY a.Emp_id ORDER BY a.event_date) AS prev_date
          FROM eg_att a
         where a.emp_id <> 'OWC - ') b
 WHERE b.prev_timestamp IS NOT NULL
   AND (b.timestamp - b.prev_timestamp) * 24 * 60 * 60 < 15
   and b.event = b.prev_event
   and b.date_part = b.prev_date) a  on e.rowid = a.row_id
   where a.row_id is null
 order by e.emp_id, e.event_date
 ) c
 ) d
where 1=1
and d.emp_name is not null
 );
