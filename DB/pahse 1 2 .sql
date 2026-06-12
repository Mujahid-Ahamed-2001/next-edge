CREATE TABLE branches (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    branch_code VARCHAR(50) UNIQUE,
    branch_name VARCHAR(255) NOT NULL,

    email VARCHAR(255),
    phone VARCHAR(50),

    city VARCHAR(150),
    district VARCHAR(150),
    country VARCHAR(150),

    is_head_office TINYINT(1) DEFAULT 0,

    is_active TINYINT(1) DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE currencies (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    currency_name VARCHAR(100),

    currency_code VARCHAR(10),

    currency_symbol VARCHAR(20),

    exchange_rate DECIMAL(18,6) DEFAULT 1,

    is_default TINYINT(1) DEFAULT 0,

    is_active TINYINT(1) DEFAULT 1
);

CREATE TABLE statuses (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    status_code VARCHAR(150),

    module_name VARCHAR(150),

    status_name VARCHAR(150),

    status_color VARCHAR(50),

    sort_order INT DEFAULT 0,

    is_default TINYINT(1) DEFAULT 0,

    is_active TINYINT(1) DEFAULT 1
);



CREATE TABLE roles (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    role_name VARCHAR(150) NOT NULL,
    role_code VARCHAR(100) UNIQUE,

    description TEXT,

    is_system_role TINYINT(1) DEFAULT 0,

    is_active TINYINT(1) DEFAULT 1,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE permissions (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    permission_name VARCHAR(255),
    permission_code VARCHAR(255) UNIQUE,

    module_name VARCHAR(150),

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE role_permissions (
    role_id BIGINT UNSIGNED,
    permission_id BIGINT UNSIGNED,

    PRIMARY KEY(role_id,permission_id),

    FOREIGN KEY(role_id)
        REFERENCES roles(id),

    FOREIGN KEY(permission_id)
        REFERENCES permissions(id)
);


CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    username VARCHAR(100) UNIQUE,

    email VARCHAR(255) UNIQUE,

    mobile VARCHAR(50) UNIQUE,

    password_hash VARCHAR(255),

    login_type ENUM(
        'staff',
        'customer',
        'supplier',
        'system'
    ),

    email_verified TINYINT(1) DEFAULT 0,

    failed_login_attempts INT DEFAULT 0,

    locked_until DATETIME NULL,

    mobile_verified TINYINT(1) DEFAULT 0,

    last_login DATETIME,

    remember_token VARCHAR(255),

    status_id BIGINT UNSIGNED,

    is_active TINYINT(1) DEFAULT 1,

    is_deleted TINYINT(1) DEFAULT 0,
    deleted_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX idx_email(email),
    INDEX idx_mobile(mobile),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);

CREATE TABLE user_roles (

    user_id BIGINT UNSIGNED,
    role_id BIGINT UNSIGNED,

    PRIMARY KEY(user_id, role_id),

    FOREIGN KEY(user_id)
        REFERENCES users(id),

    FOREIGN KEY(role_id)
        REFERENCES roles(id)
);


CREATE TABLE staff (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id BIGINT UNSIGNED NOT NULL,

    employee_no VARCHAR(100) UNIQUE,

    first_name VARCHAR(150),
    last_name VARCHAR(150),

    nic VARCHAR(50),

    dob DATE,

    gender ENUM(
        'male',
        'female',
        'other'
    ),

    email VARCHAR(255),

    mobile VARCHAR(50),

    joining_date DATE,

    branch_id BIGINT UNSIGNED,

    designation VARCHAR(150),

    department VARCHAR(150),

    basic_salary DECIMAL(18,2) DEFAULT 0,

    status_id BIGINT UNSIGNED,

    FOREIGN KEY(user_id)
        REFERENCES users(id),

    FOREIGN KEY(branch_id)
        REFERENCES branches(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);


CREATE TABLE customers (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id BIGINT UNSIGNED,

    customer_code VARCHAR(100) UNIQUE,

    company_name VARCHAR(255),

    first_name VARCHAR(150),
    last_name VARCHAR(150),

    email VARCHAR(255),
    mobile VARCHAR(50),

    credit_limit DECIMAL(18,2),

    tax_no VARCHAR(100),

    status_id BIGINT UNSIGNED,

    FOREIGN KEY(user_id)
        REFERENCES users(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),
    INDEX idx_customer_code(customer_code)
);



CREATE TABLE suppliers (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    supplier_code VARCHAR(100) UNIQUE,

    company_name VARCHAR(255),

    contact_person VARCHAR(255),

    email VARCHAR(255),

    payment_terms VARCHAR(255),

    mobile VARCHAR(50),

    tax_no VARCHAR(100),

    credit_days INT DEFAULT 0,

    status_id BIGINT UNSIGNED,

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),
    INDEX idx_supplier_code(supplier_code)
);

CREATE TABLE supplier_bank_accounts (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    supplier_id BIGINT UNSIGNED NOT NULL,

    bank_name VARCHAR(255),

    account_name VARCHAR(255),

    account_number VARCHAR(255),

    branch_name VARCHAR(255),

    swift_code VARCHAR(100),

    is_primary TINYINT(1) DEFAULT 0,

    FOREIGN KEY(supplier_id)
        REFERENCES suppliers(id)
);

CREATE TABLE system_settings (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    setting_group VARCHAR(100),

    setting_key VARCHAR(255),

    setting_value LONGTEXT,

    UNIQUE(setting_group,setting_key)
);

CREATE TABLE activity_logs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id BIGINT UNSIGNED,

    module_name VARCHAR(150),

    action_type VARCHAR(100),

    record_id BIGINT UNSIGNED,

    branch_id BIGINT UNSIGNED,

    old_values LONGTEXT,

    new_values LONGTEXT,

    ip_address VARCHAR(100),

    user_agent TEXT,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(user_id)
        REFERENCES users(id),

    FOREIGN KEY(branch_id)
        REFERENCES branches(id),

    INDEX idx_module(module_name),
    INDEX idx_record(record_id)
);

CREATE TABLE addresses (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    address_line_1 VARCHAR(255),
    address_line_2 VARCHAR(255),

    city VARCHAR(150),
    district VARCHAR(150),
    province VARCHAR(150),

    country VARCHAR(150),

    postal_code VARCHAR(50),

    latitude DECIMAL(10,8) NULL,
    longitude DECIMAL(11,8) NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE address_relations (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    module_name VARCHAR(100),

    record_id BIGINT UNSIGNED,

    address_id BIGINT UNSIGNED,

    address_type ENUM(
        'billing',
        'shipping',
        'office',
        'warehouse',
        'home',
        'branch'
    ),

    is_primary TINYINT(1) DEFAULT 0,

    FOREIGN KEY(address_id)
        REFERENCES addresses(id),

    INDEX idx_module_record(module_name, record_id)
);


CREATE TABLE warehouses (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    branch_id BIGINT UNSIGNED,

    warehouse_code VARCHAR(100),

    warehouse_name VARCHAR(255),


    FOREIGN KEY(branch_id)
        REFERENCES branches(id)
);

CREATE TABLE product_categories (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    parent_id BIGINT UNSIGNED NULL,

    category_name VARCHAR(255) NOT NULL,

    slug VARCHAR(255) NOT NULL UNIQUE,

    description TEXT,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,
    website_active TINYINT(1) DEFAULT 1,

    featured TINYINT(1) DEFAULT 0,

    is_deleted TINYINT(1) DEFAULT 0,
    deleted_at DATETIME NULL,

    FOREIGN KEY(parent_id)
        REFERENCES product_categories(id),
    FOREIGN KEY (status_id)
        REFERENCES statuses(id)
);

CREATE TABLE brands (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    brand_name VARCHAR(255) NOT NULL,

    slug VARCHAR(255) NOT NULL UNIQUE,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,
    website_active TINYINT(1) DEFAULT 1,

    featured TINYINT(1) DEFAULT 0,

    is_deleted TINYINT(1) DEFAULT 0,
    deleted_at DATETIME NULL,

    website VARCHAR(255),

    FOREIGN KEY (status_id)
        REFERENCES statuses(id)
);

CREATE TABLE taxes (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    tax_name VARCHAR(100) NOT NULL,

    tax_code VARCHAR(100) NULL,

    tax_percentage DECIMAL(10,4) NOT NULL,

    tax_type ENUM(
        'inclusive',
        'exclusive'
    )
);

CREATE TABLE products (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    product_type ENUM(
        'simple',
        'variant'
    ) NOT NULL DEFAULT 'simple',

    product_name VARCHAR(255) NOT NULL,

    slug VARCHAR(255) NOT NULL UNIQUE,

    sku VARCHAR(150) UNIQUE,

    barcode VARCHAR(255) UNIQUE,

    brand_id BIGINT UNSIGNED NULL,

    tax_id BIGINT UNSIGNED NULL,

    website_sort_order INT DEFAULT 0,

    unit_of_measure VARCHAR(50) DEFAULT 'PCS',

    short_description TEXT,

    description LONGTEXT,

    track_inventory TINYINT(1) DEFAULT 1,

    allow_backorder TINYINT(1) DEFAULT 0,

    minimum_order_qty DECIMAL(18,4) DEFAULT 1,

    maximum_order_qty DECIMAL(18,4) NULL,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    website_active TINYINT(1) DEFAULT 1,

    featured TINYINT(1) DEFAULT 0,

    is_deleted TINYINT(1) DEFAULT 0,

    deleted_at DATETIME NULL,

    created_by BIGINT UNSIGNED NULL,
    updated_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (brand_id)
        REFERENCES brands(id)
        ON DELETE SET NULL,
    FOREIGN KEY (tax_id)
        REFERENCES taxes(id)
        ON DELETE SET NULL,
    FOREIGN KEY (status_id)
        REFERENCES statuses(id)
        ON DELETE SET NULL,
    FOREIGN KEY (created_by)
        REFERENCES users(id)
        ON DELETE SET NULL,
    FOREIGN KEY (updated_by)
        REFERENCES users(id)
        ON DELETE SET NULL,
    INDEX idx_product_name(product_name),
    INDEX idx_barcode(barcode),
    INDEX idx_sku(sku),
    INDEX idx_featured(featured),
    INDEX idx_slug(slug),
    INDEX idx_status(status_id),
    INDEX idx_active(is_active),
    INDEX idx_website(website_active)

);

CREATE TABLE product_attributes (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    product_id BIGINT UNSIGNED NOT NULL,

    attribute_name VARCHAR(255) NOT NULL,

    display_order INT DEFAULT 0,

    is_active TINYINT(1) DEFAULT 1,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE

);

CREATE TABLE product_attribute_values (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    attribute_id BIGINT UNSIGNED NOT NULL,

    value_name VARCHAR(255) NOT NULL,

    display_order INT DEFAULT 0,

    is_active TINYINT(1) DEFAULT 1,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (attribute_id)
        REFERENCES product_attributes(id)
        ON DELETE CASCADE

);




CREATE TABLE product_category_relations (

    product_id BIGINT UNSIGNED,

    category_id BIGINT UNSIGNED,

    PRIMARY KEY(product_id,category_id),

    FOREIGN KEY(product_id)
        REFERENCES products(id),

    FOREIGN KEY(category_id)
        REFERENCES product_categories(id)
);
CREATE TABLE product_variants (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    product_id BIGINT UNSIGNED NOT NULL,

    variant_name VARCHAR(255),

    sku VARCHAR(150) UNIQUE,

    barcode VARCHAR(255) UNIQUE,

    cost_price DECIMAL(18,2) DEFAULT 0.00,

    selling_price DECIMAL(18,2) DEFAULT 0.00,

    weight DECIMAL(18,4) NULL,

    length DECIMAL(18,4) NULL,

    width DECIMAL(18,4) NULL,

    height DECIMAL(18,4) NULL,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    website_active TINYINT(1) DEFAULT 1,

    is_deleted TINYINT(1) DEFAULT 0,

    deleted_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE,

    FOREIGN KEY (status_id)
        REFERENCES statuses(id),

    INDEX idx_product(product_id),
    INDEX idx_sku(sku),
    INDEX idx_barcode(barcode)

);

CREATE TABLE inventory_stock (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    warehouse_id BIGINT UNSIGNED,

    product_variant_id BIGINT UNSIGNED,

    qty_on_hand DECIMAL(18,4) DEFAULT 0,

    qty_reserved DECIMAL(18,4) DEFAULT 0,

    reorder_level DECIMAL(18,4) DEFAULT 0,

    FOREIGN KEY(warehouse_id)
        REFERENCES warehouses(id),

    FOREIGN KEY(product_variant_id)
        REFERENCES product_variants(id),

    UNIQUE(warehouse_id,product_variant_id)
);

CREATE TABLE stock_movements (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    warehouse_id BIGINT UNSIGNED,

    product_variant_id BIGINT UNSIGNED,

    movement_type ENUM(
        'purchase',
        'sale',
        'return',
        'adjustment',
        'transfer'
    ),
    branch_id BIGINT UNSIGNED,
    qty_before DECIMAL(18,4),

    qty_change DECIMAL(18,4),

    qty_after DECIMAL(18,4),

    reference_type VARCHAR(100),
    reference_no VARCHAR(100) NULL,

    reference_id BIGINT UNSIGNED,

    created_by BIGINT UNSIGNED,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(branch_id)
        REFERENCES branches(id),
    FOREIGN KEY(created_by)
        REFERENCES users(id),
    FOREIGN KEY(product_variant_id)
        REFERENCES product_variants(id),
    FOREIGN KEY(warehouse_id)
        REFERENCES warehouses(id),
    

    INDEX idx_ref(reference_type,reference_id)
);

CREATE TABLE promotions (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    promotion_name VARCHAR(255),

    promotion_type ENUM(
        'percentage',
        'fixed'
    ),

    discount_value DECIMAL(18,2),

    start_date DATETIME NULL,

    end_date DATETIME NULL,

    is_active TINYINT(1) DEFAULT 1,

    status_id BIGINT UNSIGNED NULL,

    website_active TINYINT(1) DEFAULT 1,

    is_deleted TINYINT(1) DEFAULT 0,
    deleted_at DATETIME NULL,
    FOREIGN KEY (status_id)
        REFERENCES statuses(id)
);

CREATE TABLE promotion_products (

    promotion_id BIGINT UNSIGNED,

    product_id BIGINT UNSIGNED,

    PRIMARY KEY(
        promotion_id,
        product_id
    ),

    FOREIGN KEY(promotion_id)
        REFERENCES promotions(id),

    FOREIGN KEY(product_id)
        REFERENCES products(id)
);

CREATE TABLE media_folders (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    parent_id BIGINT UNSIGNED NULL,
    folder_name VARCHAR(255) NOT NULL,
    created_by BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(parent_id)
        REFERENCES media_folders(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)
);


CREATE TABLE media_library (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    folder_id BIGINT UNSIGNED NULL,

    file_name VARCHAR(255) NOT NULL,

    original_name VARCHAR(255),

    file_extension VARCHAR(20),

    mime_type VARCHAR(150),

    file_size BIGINT UNSIGNED,

    storage_type ENUM(
        'database',
        'filesystem',
        's3'
    ) DEFAULT 'filesystem',

    file_blob LONGBLOB NULL,

    file_path VARCHAR(1000) NULL,

    alt_text VARCHAR(255),

    title VARCHAR(255),

    caption TEXT,

    seo_filename VARCHAR(255),

    width INT NULL,
    height INT NULL,

    checksum VARCHAR(255),

    uploaded_by BIGINT UNSIGNED,

    is_active TINYINT(1) DEFAULT 1,

    is_deleted TINYINT(1) DEFAULT 0,
    deleted_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(folder_id)
        REFERENCES media_folders(id),

    FOREIGN KEY(uploaded_by)
        REFERENCES users(id),

    INDEX idx_file_name(file_name),
    INDEX idx_mime_type(mime_type),
    INDEX idx_storage_type(storage_type)
);




CREATE TABLE seo_meta (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    module_name VARCHAR(100),

    record_id BIGINT UNSIGNED,

    meta_title VARCHAR(255),

    meta_description TEXT,

    meta_keywords TEXT,

    canonical_url VARCHAR(500),

    og_title VARCHAR(255),

    og_description TEXT,

    og_image_media_id BIGINT UNSIGNED,

    FOREIGN KEY (og_image_media_id)
        REFERENCES media_library(id),

    INDEX idx_module_record(module_name, record_id)
);

CREATE TABLE media_relations (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    media_id BIGINT UNSIGNED NOT NULL,

    module_name VARCHAR(100) NOT NULL,

    record_id BIGINT UNSIGNED NOT NULL,

    media_type VARCHAR(100),

    sort_order INT DEFAULT 0,

    is_primary TINYINT(1) DEFAULT 0,

    FOREIGN KEY(media_id)
        REFERENCES media_library(id),

    INDEX idx_module_record(module_name, record_id)
);

CREATE TABLE product_variant_attribute_values (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    variant_id BIGINT UNSIGNED NOT NULL,

    attribute_value_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (variant_id)
        REFERENCES product_variants(id)
        ON DELETE CASCADE,

    FOREIGN KEY (attribute_value_id)
        REFERENCES product_attribute_values(id)
        ON DELETE CASCADE,

    UNIQUE (
        variant_id,
        attribute_value_id
    )

);

CREATE TABLE coupons (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    coupon_code VARCHAR(100) UNIQUE,

    coupon_name VARCHAR(255),

    discount_type ENUM(
        'percentage',
        'fixed'
    ),

    discount_value DECIMAL(18,2),

    minimum_order_amount DECIMAL(18,2) DEFAULT 0,

    usage_limit INT NULL,

    usage_count INT DEFAULT 0,

    start_date DATETIME NULL,

    end_date DATETIME NULL,

    is_active TINYINT(1) DEFAULT 1
);