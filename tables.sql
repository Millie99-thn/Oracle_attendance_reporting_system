CREATE TABLE eg_att (
    id           NUMBER PRIMARY KEY,
    event_date   DATE,
    event        VARCHAR2(10),
    emp_id       VARCHAR2(50),
    emp_name     VARCHAR2(100),
    card_number  VARCHAR2(50),
    department   VARCHAR2(100)
);

CREATE TABLE checkpoints (
    name        VARCHAR2(50) PRIMARY KEY, 
    start_time  VARCHAR2(8),              
    end_time    VARCHAR2(8)              
);

CREATE TABLE attendance_details (
    emp_code       VARCHAR2(20) NOT NULL,
    name           VARCHAR2(100) NOT NULL,
    date_          DATE NOT NULL,
    day            VARCHAR2(3) NOT NULL,        
    normal_count   NUMBER DEFAULT 0,
    half_hour_late NUMBER DEFAULT 0,
    two_hour_late  NUMBER DEFAULT 0,
    no_scan        NUMBER DEFAULT 0,
    violations     NUMBER DEFAULT 0,
    remark         VARCHAR2(10) NULL,            

    CONSTRAINT pk_attendance_details PRIMARY KEY (emp_code, date_)
);
