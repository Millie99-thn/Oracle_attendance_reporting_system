CREATE OR REPLACE VIEW V_ATT_SUMMARY AS
select
vv.EMP_ID,
vv.EMP_NAME,
vv.WORK_DATE,
vv.FIRST_IN,
vv.LUNCH_OUT,
vv.LUNCH_IN,
vv.LAST_OUT,
vv.TRANSITION,
vv.vio_count,
vv.pair,
vv.checkpoint1,
vv.checkpoint2,
vv.checkpoint3,
vv.checkpoint4,
vc.normal_count,
vc.late_point5h,
vc.late_2h,
vc.no_scan,

NULL  Remark
from
v_att_status vv

join
 (
SELECT
    vs.EMP_ID,
    vs.EMP_NAME,
    vs.WORK_DATE,

    -- Count "normal" based on the day of the week
    SUM(
        CASE
            WHEN c.day_of_week = 'SAT' THEN
                CASE WHEN vs.checkpoint1 = 'normal' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = 'normal' THEN 1 ELSE 0 END
            ELSE
                CASE WHEN vs.checkpoint1 = 'normal' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = 'normal' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint3 = 'normal' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint4 = 'normal' THEN 1 ELSE 0 END
        END
    ) AS normal_count,


    -- Count "0.5H" late points
    SUM(
        CASE
            WHEN c.day_of_week = 'SAT' THEN
                CASE WHEN vs.checkpoint1 = '0.5H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = '0.5H' THEN 1 ELSE 0 END
            ELSE
                CASE WHEN vs.checkpoint1 = '0.5H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = '0.5H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint3 = '0.5H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint4 = '0.5H' THEN 1 ELSE 0 END
        END
    ) AS late_point5H,

    -- Count "2H" late points
    SUM(
        CASE
            WHEN c.day_of_week = 'SAT' THEN
                CASE WHEN vs.checkpoint1 = '2H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = '2H' THEN 1 ELSE 0 END
            ELSE
                CASE WHEN vs.checkpoint1 = '2H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = '2H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint3 = '2H' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint4 = '2H' THEN 1 ELSE 0 END
        END
    ) AS late_2H,

    -- Count "no scan"
    SUM(
        CASE
            WHEN c.day_of_week = 'SAT' THEN
                CASE WHEN vs.checkpoint1 = '...' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = '...' THEN 1 ELSE 0 END
            ELSE
                CASE WHEN vs.checkpoint1 = '...' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint2 = '...' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint3 = '...' THEN 1 ELSE 0 END +
                CASE WHEN vs.checkpoint4 = '...' THEN 1 ELSE 0 END
        END
    ) AS no_scan

FROM v_att_status vs
LEFT JOIN calendar c ON vs.WORK_DATE = c.calendar_date
GROUP BY vs.EMP_ID, vs.EMP_NAME, vs.WORK_DATE ) vc
on vv.EMP_ID = vc.emp_id
and vv.WORK_DATE = vc.work_date
order by vv.WORK_DATE , vv.EMP_ID
;
