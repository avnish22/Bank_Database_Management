CREATE DATABASE bank_management_db;

SHOW DATABASES;

USE bank_management_db;

-- CUSTOMER_PERSONAL_INFO --

CREATE TABLE customer_personal_info (
    customer_id VARCHAR(5),
    customer_name VARCHAR(25),
    date_of_birth DATE,
    guardian_name VARCHAR(25),
    address VARCHAR(50),
    contact_no BIGINT(13),
    mail_id VARCHAR(30),
    gender CHAR(1),
    marital_status VARCHAR(10),
    id_doc_type VARCHAR(20),
    id_doc_no VARCHAR(20),
    citizenship VARCHAR(10),
    CONSTRAINT cust_per_pk PRIMARY KEY (customer_id)
);

show tables;

-- CUSTOMER_REFERENCE_INFO --

CREATE TABLE customer_reference_info (
    customer_id VARCHAR(5),
    reference_acc_name VARCHAR(20),
    reference_acc_no BIGINT(16),
    reference_acc_address VARCHAR(50),
    relation VARCHAR(25),
    CONSTRAINT cust_ref_info_pk PRIMARY KEY (customer_id),
    CONSTRAINT cust_ref_info_fk FOREIGN KEY (customer_id)
        REFERENCES customer_personal_info (customer_id)
);

SHOW TABLES;
-- BANK_INFO --

CREATE TABLE bank_info (
    ifsc_code VARCHAR(15),
    bank_name VARCHAR(25),
    branch_name VARCHAR(25),
    CONSTRAINT bank_info_pk PRIMARY KEY (ifsc_code)
);

SHOW TABLES;
-- ACCOUNT_INFO --

CREATE TABLE account_info (
    account_no INT(16),
    customer_id VARCHAR(5),
    account_type VARCHAR(10),
    registration_date DATE,
    activation_date DATE,
    ifsc_code VARCHAR(10),
    interest DECIMAL(7 , 2 ),
    initial_deposit BIGINT(10),
    CONSTRAINT acc_info_pk PRIMARY KEY (account_no),
    CONSTRAINT acc_info_pers_fk FOREIGN KEY (customer_id)
        REFERENCES customer_personal_info (customer_id),
    CONSTRAINT acc_info_bank_fk FOREIGN KEY (ifsc_code)
        REFERENCES bank_info (ifsc_code)
);
SHOW TABLES;

INSERT INTO customer_personal_info VALUES('C1001','Jhon','2000-11-21','Joe','Ghumarwin,HP',7804290544,'jhon22@gmail.com','M','Single','Passport','AB102938','India')
INSERT INTO customer_personal_info VALUES('C1002','Luci','1990-01-11','Morning','Bilaspur,HP',9804290548,'mailing22@gmail.com','F','Maried','Pancard','PNC102938','India')
INSERT INTO customer_personal_info VALUES('C1003','Mike','1995-12-09','Tye','Jhanduta,HP',8804290535,'this22@gmail.com','F','Maried','Adhar Card','908265102938','India')
INSERT INTO customer_personal_info VALUES('C1004','Tyson','1998-03-24','Mike','Auhar,HP',7804291550,'mail22@gmail.com','M','Maried','Passport','CV102938','India')
INSERT INTO customer_personal_info VALUES('C1005','Mack','1999-09-09','Hula','Bharari,HP',7904390544,'play22@gmail.com','M','Single','Passport','PO102938','India')

SELECT * FROM customer_personal_info;

SELECT gender, COUNT(*) FROM customer_personal_info GROUP BY gender;


-- CUSTOMER_REFERENCE_INFO --

INSERT INTO customer_reference_info VALUES ('C1002','Glen',9801872625,'Ghumarwin,HP','Friend')
INSERT INTO customer_reference_info VALUES ('C1003','Shoib',8901872625,'Ghumarwin,HP','Colleuge')
INSERT INTO customer_reference_info VALUES ('C1004','Mohiv',89901872625,'Bhota,HP','Guardian')
INSERT INTO customer_reference_info VALUES ('C1005','Glister',9901872625,'Bilaspur,HP','Relative')

SELECT * FROM customer_reference_info;

-- BANK_INFO --

INSERT INTO bank_info VALUES ('SBIN09826','SBI','Bharari')
INSERT INTO bank_info VALUES ('HDFS09176','HDFC','Ghumarwin')
INSERT INTO bank_info VALUES ('ICICI8027','ICICI','Ghumarwin')
INSERT INTO bank_info VALUES ('SBIN01522','SBI','Jhanduta')
INSERT INTO bank_info VALUES ('ICICI2826','ICICI','Auhar')

SELECT * FROM bank_info;

-- ACCOUNT_INFO --

INSERT INTO account_info VALUES ('1000001','C1001','Saving','2022-11-15','2022-11-22','HDFS09176',0.12,5000)
INSERT INTO account_info VALUES ('1000002','C1002','Saving','2022-11-16','2022-11-23','SBIN09826',0.22,5500)
INSERT INTO account_info VALUES ('1000003','C1003','Current','2022-11-17','2022-11-24','ICICI8027',0.28,10000)
INSERT INTO account_info VALUES ('1000004','C1004','Current','2022-11-18','2022-11-25','SBIN01522',0.70,2000)

SELECT * FROM account_info;


-- JOINS --
-- To find reference account name and reference account number through joins --

SELECT 
    customer_personal_info.customer_name AS Customer_Name,
    customer_reference_info.reference_acc_name AS Reffered_name,
    customer_reference_info.reference_acc_no AS refferal_account_no,
    customer_reference_info.reference_acc_address AS refferal_address
FROM
    customer_personal_info
        INNER JOIN
    customer_reference_info ON customer_personal_info.customer_id = customer_reference_info.customer_id;
    
    

