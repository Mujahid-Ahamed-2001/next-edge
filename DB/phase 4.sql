SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS invoice_items;

DROP TABLE IF EXISTS coupon_usage;

DROP TABLE IF EXISTS payment_allocations;

DROP TABLE IF EXISTS payments;

DROP TABLE IF EXISTS invoices;

DROP TABLE IF EXISTS quotation_items;

DROP TABLE IF EXISTS quotation_remarks;

DROP TABLE IF EXISTS quotations;

DROP TABLE IF EXISTS order_tracking;

DROP TABLE IF EXISTS order_history;

DROP TABLE IF EXISTS order_notes;

DROP TABLE IF EXISTS order_items;

DROP TABLE IF EXISTS wishlist_items;

DROP TABLE IF EXISTS wishlists;

DROP TABLE IF EXISTS cart_items;

DROP TABLE IF EXISTS carts;

DROP TABLE IF EXISTS payment_methods;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS sales_representatives;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE sales_representatives (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    staff_id BIGINT UNSIGNED NULL,

    rep_code VARCHAR(100) UNIQUE,

    commission_type ENUM(
        'fixed',
        'percentage'
    ) DEFAULT 'percentage',

    commission_value DECIMAL(18,2) DEFAULT 0,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(staff_id)
        REFERENCES staff(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)

);
CREATE TABLE quotations (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    quotation_no VARCHAR(100) UNIQUE,

    customer_id BIGINT UNSIGNED,

    sales_rep_id BIGINT UNSIGNED NULL,

    branch_id BIGINT UNSIGNED NULL,

    status_id BIGINT UNSIGNED,

    valid_until DATE,

    subtotal DECIMAL(18,2) DEFAULT 0,

    discount_amount DECIMAL(18,2) DEFAULT 0,

    tax_amount DECIMAL(18,2) DEFAULT 0,

    grand_total DECIMAL(18,2) DEFAULT 0,

    converted_to_order_id BIGINT UNSIGNED NULL,

    converted_at DATETIME NULL,

    internal_remarks LONGTEXT NULL,

    customer_remarks LONGTEXT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(customer_id)
        REFERENCES customers(id),

    FOREIGN KEY(sales_rep_id)
        REFERENCES sales_representatives(id),

    FOREIGN KEY(branch_id)
        REFERENCES branches(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);
CREATE TABLE orders (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    order_no VARCHAR(100) NOT NULL UNIQUE,

    quotation_id BIGINT UNSIGNED NULL,

    customer_id BIGINT UNSIGNED NULL,

    sales_rep_id BIGINT UNSIGNED NULL,

    branch_id BIGINT UNSIGNED NOT NULL,

    currency_id BIGINT UNSIGNED NULL,

    billing_address_id BIGINT UNSIGNED NULL,

    shipping_address_id BIGINT UNSIGNED NULL,

    order_source ENUM(
        'website',
        'dashboard',
        'pos',
        'mobile_app'
    ) DEFAULT 'website',

    status_id BIGINT UNSIGNED NULL,

    subtotal DECIMAL(18,2) DEFAULT 0,

    discount_amount DECIMAL(18,2) DEFAULT 0,

    tax_amount DECIMAL(18,2) DEFAULT 0,

    shipping_amount DECIMAL(18,2) DEFAULT 0,

    grand_total DECIMAL(18,2) DEFAULT 0,

    internal_remarks LONGTEXT NULL,

    customer_remarks LONGTEXT NULL,

    ordered_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    created_by BIGINT UNSIGNED NULL,

    updated_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (quotation_id)
        REFERENCES quotations(id),

    FOREIGN KEY (customer_id)
        REFERENCES customers(id),

    FOREIGN KEY (sales_rep_id)
        REFERENCES sales_representatives(id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(id),

    FOREIGN KEY (currency_id)
        REFERENCES currencies(id),

    FOREIGN KEY (billing_address_id)
        REFERENCES addresses(id),

    FOREIGN KEY (shipping_address_id)
        REFERENCES addresses(id),

    FOREIGN KEY (status_id)
        REFERENCES statuses(id),

    FOREIGN KEY (created_by)
        REFERENCES users(id),

    FOREIGN KEY (updated_by)
        REFERENCES users(id)

);




CREATE TABLE carts (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    customer_id BIGINT UNSIGNED NULL,

    session_token VARCHAR(255),

    expires_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(customer_id)
        REFERENCES customers(id)
);

CREATE TABLE cart_items (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    cart_id BIGINT UNSIGNED NOT NULL,

    item_type ENUM(
        'product',
        'service',
        'service_package'
    ),

    product_variant_id BIGINT UNSIGNED NULL,

    service_id BIGINT UNSIGNED NULL,

    service_package_id BIGINT UNSIGNED NULL,

    quantity DECIMAL(18,4) DEFAULT 1,

    unit_price DECIMAL(18,2) DEFAULT 0,

    line_total DECIMAL(18,2) DEFAULT 0,

    FOREIGN KEY(cart_id)
        REFERENCES carts(id)
        ON DELETE CASCADE,

    FOREIGN KEY(product_variant_id)
        REFERENCES product_variants(id),

    FOREIGN KEY(service_id)
        REFERENCES services(id),

    FOREIGN KEY(service_package_id)
        REFERENCES service_packages(id)
);

CREATE TABLE wishlists (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    customer_id BIGINT UNSIGNED NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(customer_id)
        REFERENCES customers(id)
);

CREATE TABLE wishlist_items (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    wishlist_id BIGINT UNSIGNED NOT NULL,

    item_type ENUM(
        'product',
        'service',
        'service_package'
    ) NOT NULL,

    item_id BIGINT UNSIGNED NOT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (wishlist_id)
        REFERENCES wishlists(id)
        ON DELETE CASCADE,

    UNIQUE (
        wishlist_id,
        item_type,
        item_id
    )

);

CREATE TABLE order_items (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    order_id BIGINT UNSIGNED NOT NULL,

    product_variant_id BIGINT UNSIGNED NULL,

    service_id BIGINT UNSIGNED NULL,

    service_package_id BIGINT UNSIGNED NULL,

    quantity DECIMAL(18,4) DEFAULT 1,

    unit_price DECIMAL(18,2) DEFAULT 0,

    discount_amount DECIMAL(18,2) DEFAULT 0,

    tax_amount DECIMAL(18,2) DEFAULT 0,

    line_total DECIMAL(18,2) DEFAULT 0,

    FOREIGN KEY(order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE,
    FOREIGN KEY(product_variant_id)
        REFERENCES product_variants(id)
        ON DELETE CASCADE,

    FOREIGN KEY(service_id)
        REFERENCES services(id)
        ON DELETE CASCADE,

    FOREIGN KEY(service_package_id)
        REFERENCES service_packages(id)
        ON DELETE CASCADE
);

CREATE TABLE order_notes (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    order_id BIGINT UNSIGNED NOT NULL,

    note_text LONGTEXT,

    visible_to_customer TINYINT(1) DEFAULT 0,

    created_by BIGINT UNSIGNED,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(order_id)
        REFERENCES orders(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)
);

CREATE TABLE order_history (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    order_id BIGINT UNSIGNED NOT NULL,

    status_id BIGINT UNSIGNED,

    remarks LONGTEXT,

    changed_by BIGINT UNSIGNED,

    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(order_id)
        REFERENCES orders(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(changed_by)
        REFERENCES users(id)
);

CREATE TABLE order_tracking (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    order_id BIGINT UNSIGNED NOT NULL,

    tracking_number VARCHAR(255),

    tracking_status VARCHAR(255),

    tracking_url VARCHAR(500),

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(order_id)
        REFERENCES orders(id)
);


CREATE TABLE quotation_remarks (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    quotation_id BIGINT UNSIGNED NOT NULL,

    remark_type ENUM(
        'internal',
        'customer',
        'system'
    ) DEFAULT 'internal',

    remark_text LONGTEXT NOT NULL,

    created_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (quotation_id)
        REFERENCES quotations(id)
        ON DELETE CASCADE,

    FOREIGN KEY (created_by)
        REFERENCES users(id)

);

CREATE TABLE quotation_items (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    quotation_id BIGINT UNSIGNED NOT NULL,

    item_type ENUM(
        'product',
        'service',
        'service_package'
    ),

    item_id BIGINT UNSIGNED NOT NULL,

    quantity DECIMAL(18,4),

    unit_price DECIMAL(18,2),

    line_total DECIMAL(18,2),

    FOREIGN KEY(quotation_id)
        REFERENCES quotations(id)
        ON DELETE CASCADE
);

CREATE TABLE payment_methods (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    method_name VARCHAR(255),

    method_code VARCHAR(100),

    is_online TINYINT(1) DEFAULT 0,

    status_id BIGINT UNSIGNED NULL,

    description TEXT,

    processing_fee DECIMAL(18,2) DEFAULT 0,

    sort_order INT DEFAULT 0,

    website_active TINYINT(1) DEFAULT 1,

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);

CREATE TABLE payments (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    payment_no VARCHAR(100) UNIQUE,

    customer_id BIGINT UNSIGNED NULL,

    payment_method_id BIGINT UNSIGNED,

    amount DECIMAL(18,2),

    payment_date DATETIME,

    transaction_reference VARCHAR(255),

    remarks LONGTEXT,

    created_by BIGINT UNSIGNED NULL,

    status_id BIGINT UNSIGNED NULL,

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(customer_id)
        REFERENCES customers(id),

    FOREIGN KEY(payment_method_id)
        REFERENCES payment_methods(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)
);

CREATE TABLE payment_allocations (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    payment_id BIGINT UNSIGNED NOT NULL,

    reference_type ENUM(
        'order',
        'invoice',
        'quotation'
    ),

    reference_id BIGINT UNSIGNED NOT NULL,

    allocated_amount DECIMAL(18,2),

    FOREIGN KEY(payment_id)
        REFERENCES payments(id)
);

CREATE TABLE coupon_usage (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    coupon_id BIGINT UNSIGNED,

    customer_id BIGINT UNSIGNED,

    order_id BIGINT UNSIGNED,

    used_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(coupon_id)
        REFERENCES coupons(id),

    FOREIGN KEY(customer_id)
        REFERENCES customers(id),

    FOREIGN KEY(order_id)
        REFERENCES orders(id)
);

CREATE TABLE invoices (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    invoice_no VARCHAR(100) UNIQUE,

    order_id BIGINT UNSIGNED NULL,

    customer_id BIGINT UNSIGNED NOT NULL,

    invoice_date DATETIME,

    due_date DATETIME NULL,

    subtotal DECIMAL(18,2),

    tax_amount DECIMAL(18,2),

    grand_total DECIMAL(18,2),

    status_id BIGINT UNSIGNED NULL,

    branch_id BIGINT UNSIGNED NULL,

    currency_id BIGINT UNSIGNED NULL,

    discount_amount DECIMAL(18,2) DEFAULT 0,

    paid_amount DECIMAL(18,2) DEFAULT 0,

    balance_amount DECIMAL(18,2) DEFAULT 0,

    remarks LONGTEXT,

    created_by BIGINT UNSIGNED NULL,

    FOREIGN KEY(order_id)
        REFERENCES orders(id),

    FOREIGN KEY(customer_id)
        REFERENCES customers(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);

CREATE TABLE invoice_items (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    invoice_id BIGINT UNSIGNED NOT NULL,

    item_type ENUM(
        'product',
        'service',
        'service_package'
    ),

    product_variant_id BIGINT UNSIGNED NULL,

    service_id BIGINT UNSIGNED NULL,

    service_package_id BIGINT UNSIGNED NULL,

    quantity DECIMAL(18,4),

    unit_price DECIMAL(18,2),

    discount_amount DECIMAL(18,2) DEFAULT 0,

    tax_amount DECIMAL(18,2) DEFAULT 0,

    line_total DECIMAL(18,2),

    FOREIGN KEY(invoice_id)
        REFERENCES invoices(id)
        ON DELETE CASCADE,
    FOREIGN KEY(product_variant_id)
        REFERENCES product_variants(id)
        ON DELETE CASCADE,

    FOREIGN KEY(service_id)
        REFERENCES services(id)
        ON DELETE CASCADE,

    FOREIGN KEY(service_package_id)
        REFERENCES service_packages(id)
        ON DELETE CASCADE
);