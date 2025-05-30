# Attendance Reporting System

## Overview
This project is an Oracle-based Attendance Reporting System designed to automate processing and summarizing employee attendance data collected from a face scan machine. It processes raw attendance logs, applies company attendance rules, and generates detailed reports on employee attendance status, late arrivals, absences, and violations.

---

## Features
- Import raw attendance data exported from face scan machines.
- Clean and normalize attendance records using PL/SQL scripts and views.
- Apply shift and attendance rules to classify attendance (e.g., normal, late, no scan).
- Aggregate attendance metrics by employee and by attendance remark type.
- Generate monthly attendance reports for management review.
- Support for multiple attendance remarks (leave, official leave, compensations, etc.)
- SQL scripts and views are modular and easy to customize for new business rules.

---

## Project Structure

| File / Folder         | Description                                |
|----------------------|--------------------------------------------|
| `sql_scripts/`        | PL/SQL scripts for data processing         |
| `views/`              | Oracle views for attendance aggregation    |
| `data/`               | Sample or exported attendance raw data     |
| `README.md`           | Project overview and instructions           |

---

## How to Use

1. **Setup Oracle Database**
   - Create necessary tables for attendance details, rules, and remarks.
   - Import the provided PL/SQL scripts to define views and processing logic.

2. **Import Raw Attendance Data**
   - Export data from the face scan machine into a compatible format.
   - Load the data into the `attendance_details` table.

3. **Run Attendance Processing**
   - Use the provided views (`V_ATT_FINAL` and others) to aggregate and classify attendance records.
   - Execute SQL queries to retrieve monthly reports per employee.

4. **Generate Reports**
   - Query the final attendance view for insights on employee attendance status and violations.
   - Export results for management use.

---

## Sample Query to Get Monthly Attendance Summary

```sql
SELECT *
FROM V_ATT_FINAL
WHERE month = '2023-04';
