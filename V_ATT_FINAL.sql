CREATE OR REPLACE VIEW V_ATT_FINAL AS
(
SELECT
    a.emp_code,
    a.name,
    64 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark is null
GROUP BY a.emp_code, a.name

Union all

SELECT
    a.emp_code,
    a.name,
    64 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark = 'C'
GROUP BY a.emp_code, a.name

Union all

SELECT
    a.emp_code,
    a.name,
    64 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark = 'P'
GROUP BY a.emp_code, a.name

Union all

SELECT
    a.emp_code,
    a.name,
    64 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark = 'CC'
GROUP BY a.emp_code, a.name

Union all

SELECT
    a.emp_code,
    a.name,
    64 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark = 'OS'
GROUP BY a.emp_code, a.name

Union all

SELECT
    a.emp_code,
    a.name,
    32 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark = 'S'
GROUP BY a.emp_code, a.name

Union all

SELECT
    a.emp_code,
    a.name,
    60 AS "Normal",
    0 AS "0.5H",
    0 AS "2H",
    0 AS No_scan,
    0 AS violations,
    SUM(CASE WHEN a.normal_count > 0  THEN a.normal_count END) "Actual_Normal",
    SUM(CASE WHEN a.half_hour_late > 0  THEN a.half_hour_late END) "Actual_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0  THEN a.two_hour_late END) "Actual_2H" ,
    SUM(CASE WHEN a.no_scan > 0  THEN a.no_scan END) Actual_No_scan ,
    SUM(CASE WHEN a.violations > 0  THEN a.violations END) Actual_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SAT' THEN a.normal_count END) "SAT_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SAT'  THEN a.half_hour_late END) "SAT_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SAT'  THEN a.two_hour_late END) "SAT_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SAT'  THEN a.no_scan END) SAT_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SAT'  THEN a.violations END) SAT_vio ,
    SUM(CASE WHEN a.normal_count > 0 and a.day = 'SUN' THEN a.normal_count END) "SUN_Normal",
    SUM(CASE WHEN a.half_hour_late > 0 and a.day = 'SUN' THEN a.half_hour_late END) "SUN_0.5H" ,
    SUM(CASE WHEN a.two_hour_late > 0 and a.day = 'SUN' THEN a.two_hour_late END) "SUN_2H" ,
    SUM(CASE WHEN a.no_scan > 0 and a.day = 'SUN' THEN a.no_scan END) SUN_No_scan ,
    SUM(CASE WHEN a.violations > 0 and a.day = 'SUN' THEN a.violations END) SUN_vio
FROM attendance_details a
WHERE a.date_ >= DATE '2025-03-01'
and a.remark = 'N'
GROUP BY a.emp_code, a.name
);
