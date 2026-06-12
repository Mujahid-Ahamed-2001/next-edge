SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS general_ledger;

DROP TABLE IF EXISTS journal_entry_lines;

DROP TABLE IF EXISTS expense_items;

DROP TABLE IF EXISTS income_records;

DROP TABLE IF EXISTS expenses;

DROP TABLE IF EXISTS bank_accounts;

DROP TABLE IF EXISTS journal_entries;

DROP TABLE IF EXISTS chart_of_accounts;

DROP TABLE IF EXISTS account_types;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE account_types (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    type_name VARCHAR(100) NOT NULL,

    type_code VARCHAR(50) NOT NULL UNIQUE,

    normal_balance ENUM(
        'debit',
        'credit'
    ) NOT NULL

);

INSERT INTO account_types
(type_name, type_code, normal_balance)
VALUES

('Assets', 'ASSET', 'debit'),

('Liabilities', 'LIABILITY', 'credit'),

('Equity', 'EQUITY', 'credit'),

('Income', 'INCOME', 'credit'),

('Cost of Sales', 'COS', 'debit'),

('Expenses', 'EXPENSE', 'debit');

CREATE TABLE chart_of_accounts (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    parent_id BIGINT UNSIGNED NULL,

    account_code VARCHAR(50) NOT NULL UNIQUE,

    account_name VARCHAR(255) NOT NULL,

    account_type_id BIGINT UNSIGNED NOT NULL,

    description TEXT NULL,

    is_system TINYINT(1) DEFAULT 0,

    allow_manual_entries TINYINT(1) DEFAULT 1,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(parent_id)
        REFERENCES chart_of_accounts(id),

    FOREIGN KEY(account_type_id)
        REFERENCES account_types(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)

);

INSERT INTO chart_of_accounts
(parent_id, account_code, account_name, account_type_id, is_system)
VALUES

(NULL,'1000','Assets',1,1),

(1,'1100','Cash & Cash Equivalents',1,1),

(2,'1110','Cash On Hand',1,1),
(2,'1120','Petty Cash',1,1),
(2,'1130','Commercial Bank Account',1,1),
(2,'1140','Sampath Bank Account',1,1),
(2,'1150','PayHere Clearing Account',1,1),
(2,'1160','Stripe Clearing Account',1,1),

(1,'1200','Accounts Receivable',1,1),

(1,'1300','Inventory Assets',1,1),

(1,'1400','Fixed Assets',1,1),

(10,'1410','Computers & Equipment',1,1),
(10,'1420','Furniture & Fixtures',1,1),
(10,'1430','Vehicles',1,1);

INSERT INTO chart_of_accounts
(parent_id, account_code, account_name, account_type_id, is_system)
VALUES

(NULL,'2000','Liabilities',2,1),

(14,'2100','Accounts Payable',2,1),

(14,'2200','Taxes Payable',2,1),

(14,'2300','Customer Deposits',2,1),

(14,'2400','Accrued Expenses',2,1);

INSERT INTO chart_of_accounts
(parent_id, account_code, account_name, account_type_id, is_system)
VALUES

(NULL,'3000','Equity',3,1),

(19,'3100','Owner Capital',3,1),

(19,'3200','Retained Earnings',3,1),

(19,'3300','Current Year Earnings',3,1);

INSERT INTO chart_of_accounts
(parent_id, account_code, account_name, account_type_id, is_system)
VALUES

(NULL,'4000','Income',4,1),

(23,'4100','Product Sales Income',4,1),

(23,'4200','Service Sales Income',4,1),

(23,'4300','Shipping Income',4,1),

(23,'4400','Other Income',4,1),

(23,'4500','Interest Income',4,1);

INSERT INTO chart_of_accounts
(parent_id, account_code, account_name, account_type_id, is_system)
VALUES

(NULL,'5000','Cost of Sales',5,1),

(29,'5100','Product Cost of Sales',5,1),

(29,'5200','Service Delivery Costs',5,1);

INSERT INTO chart_of_accounts
(parent_id, account_code, account_name, account_type_id, is_system)
VALUES

(NULL,'6000','Expenses',6,1),

(32,'6100','Salaries Expense',6,1),

(32,'6200','Rent Expense',6,1),

(32,'6300','Utilities Expense',6,1),

(32,'6400','Marketing Expense',6,1),

(32,'6500','Bank Charges',6,1),

(32,'6600','Software Subscriptions',6,1),

(32,'6700','Office Supplies',6,1),

(32,'6800','Internet & Communication',6,1),

(32,'6900','Travel Expense',6,1),

(32,'7000','Depreciation Expense',6,1),

(32,'7100','Miscellaneous Expense',6,1);

CREATE TABLE journal_entries (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    journal_no VARCHAR(100) UNIQUE,

    entry_date DATE NOT NULL,

    reference_type VARCHAR(100) NULL,

    reference_id BIGINT UNSIGNED NULL,

    description LONGTEXT,

    created_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(created_by)
        REFERENCES users(id)

);

CREATE TABLE journal_entry_lines (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    journal_entry_id BIGINT UNSIGNED NOT NULL,

    account_id BIGINT UNSIGNED NOT NULL,

    debit_amount DECIMAL(18,2) DEFAULT 0,

    credit_amount DECIMAL(18,2) DEFAULT 0,

    description TEXT NULL,

    FOREIGN KEY(journal_entry_id)
        REFERENCES journal_entries(id)
        ON DELETE CASCADE,

    FOREIGN KEY(account_id)
        REFERENCES chart_of_accounts(id)

);

CREATE TABLE general_ledger (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    account_id BIGINT UNSIGNED NOT NULL,

    journal_entry_id BIGINT UNSIGNED NOT NULL,

    transaction_date DATE NOT NULL,

    debit_amount DECIMAL(18,2) DEFAULT 0,

    credit_amount DECIMAL(18,2) DEFAULT 0,

    running_balance DECIMAL(18,2) DEFAULT 0,

    FOREIGN KEY(account_id)
        REFERENCES chart_of_accounts(id),

    FOREIGN KEY(journal_entry_id)
        REFERENCES journal_entries(id)

);

CREATE TABLE bank_accounts (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    account_name VARCHAR(255),

    bank_name VARCHAR(255),

    account_number VARCHAR(255),

    branch_name VARCHAR(255),

    chart_account_id BIGINT UNSIGNED NOT NULL,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    FOREIGN KEY(chart_account_id)
        REFERENCES chart_of_accounts(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)

);

CREATE TABLE expenses (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    expense_no VARCHAR(100) UNIQUE,

    branch_id BIGINT UNSIGNED NULL,

    supplier_id BIGINT UNSIGNED NULL,

    expense_date DATE,

    total_amount DECIMAL(18,2),

    status_id BIGINT UNSIGNED NULL,

    remarks LONGTEXT,

    created_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(branch_id)
        REFERENCES branches(id),

    FOREIGN KEY(supplier_id)
        REFERENCES suppliers(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)

);

CREATE TABLE expense_items (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    expense_id BIGINT UNSIGNED NOT NULL,

    account_id BIGINT UNSIGNED NOT NULL,

    description TEXT,

    amount DECIMAL(18,2),

    FOREIGN KEY(expense_id)
        REFERENCES expenses(id)
        ON DELETE CASCADE,

    FOREIGN KEY(account_id)
        REFERENCES chart_of_accounts(id)

);

CREATE TABLE income_records (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    income_no VARCHAR(100) UNIQUE,

    income_date DATE,

    account_id BIGINT UNSIGNED NOT NULL,

    amount DECIMAL(18,2),

    description LONGTEXT,

    status_id BIGINT UNSIGNED NULL,

    created_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(account_id)
        REFERENCES chart_of_accounts(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)

);