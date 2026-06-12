SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS inquiry_followups;

DROP TABLE IF EXISTS inquiry_submission_files;
DROP TABLE IF EXISTS inquiry_submission_values;

DROP TABLE IF EXISTS inquiry_submissions;

DROP TABLE IF EXISTS inquiry_email_templates;
DROP TABLE IF EXISTS inquiry_email_recipients;

DROP TABLE IF EXISTS inquiry_form_field_options;
DROP TABLE IF EXISTS inquiry_form_fields;

DROP TABLE IF EXISTS inquiry_forms;

DROP TABLE IF EXISTS promotion_services;

DROP TABLE IF EXISTS review_replies;
DROP TABLE IF EXISTS service_reviews;

DROP TABLE IF EXISTS service_faqs;

DROP TABLE IF EXISTS package_features;
DROP TABLE IF EXISTS package_feature_groups;

DROP TABLE IF EXISTS service_contents;

DROP TABLE IF EXISTS service_category_relations;

DROP TABLE IF EXISTS service_packages;

DROP TABLE IF EXISTS services;

DROP TABLE IF EXISTS service_categories;

DROP TABLE IF EXISTS testimonials;

DROP TABLE IF EXISTS clients;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE service_categories (

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

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (parent_id)
        REFERENCES service_categories(id),

    FOREIGN KEY (status_id)
        REFERENCES statuses(id)

);

CREATE TABLE services (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    service_name VARCHAR(255) NOT NULL,

    slug VARCHAR(255) NOT NULL UNIQUE,

    short_description TEXT,

    description LONGTEXT,

    estimated_delivery_days INT NULL,

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

    FOREIGN KEY (status_id)
        REFERENCES statuses(id),

    FOREIGN KEY (created_by)
        REFERENCES users(id),

    FOREIGN KEY (updated_by)
        REFERENCES users(id)

);

CREATE TABLE service_category_relations (

    service_id BIGINT UNSIGNED,

    category_id BIGINT UNSIGNED,

    PRIMARY KEY(service_id, category_id),

    FOREIGN KEY(service_id)
        REFERENCES services(id),

    FOREIGN KEY(category_id)
        REFERENCES service_categories(id)

);

CREATE TABLE service_contents (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    service_id BIGINT UNSIGNED NOT NULL,

    content_type ENUM(
        'text',
        'image',
        'video',
        'html'
    ),

    content LONGTEXT,

    display_order INT DEFAULT 0,

    FOREIGN KEY(service_id)
        REFERENCES services(id)
        ON DELETE CASCADE

);

CREATE TABLE service_packages (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    service_id BIGINT UNSIGNED NOT NULL,

    package_name VARCHAR(255) NOT NULL,

    slug VARCHAR(255) NOT NULL UNIQUE,

    short_description TEXT,

    description LONGTEXT,

    cost_price DECIMAL(18,2) DEFAULT 0,

    selling_price DECIMAL(18,2) DEFAULT 0,

    estimated_delivery_days INT NULL,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    website_active TINYINT(1) DEFAULT 1,

    featured TINYINT(1) DEFAULT 0,

    is_deleted TINYINT(1) DEFAULT 0,

    display_order INT DEFAULT 0,

    deleted_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(service_id)
        REFERENCES services(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)

);

CREATE TABLE package_features (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    package_id BIGINT UNSIGNED NOT NULL,

    group_id BIGINT UNSIGNED NULL,

    feature_name VARCHAR(255) NOT NULL,

    display_order INT DEFAULT 0,

    FOREIGN KEY(package_id)
        REFERENCES service_packages(id)
        ON DELETE CASCADE

);

CREATE TABLE service_faqs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    service_id BIGINT UNSIGNED NOT NULL,

    question VARCHAR(500),

    answer LONGTEXT,

    display_order INT DEFAULT 0,

    FOREIGN KEY(service_id)
        REFERENCES services(id)
        ON DELETE CASCADE

);

CREATE TABLE service_reviews (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    service_id BIGINT UNSIGNED NOT NULL,

    customer_id BIGINT UNSIGNED NOT NULL,

    rating DECIMAL(3,2) DEFAULT 0,

    review_text LONGTEXT,

    is_approved TINYINT(1) DEFAULT 0,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(service_id)
        REFERENCES services(id),

    FOREIGN KEY(customer_id)
        REFERENCES customers(id)

);

CREATE TABLE review_replies (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    review_id BIGINT UNSIGNED NOT NULL,

    user_id BIGINT UNSIGNED NOT NULL,

    reply_text LONGTEXT,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(review_id)
        REFERENCES service_reviews(id),

    FOREIGN KEY(user_id)
        REFERENCES users(id)

);

CREATE TABLE promotion_services (

    promotion_id BIGINT UNSIGNED,

    service_id BIGINT UNSIGNED,

    PRIMARY KEY(
        promotion_id,
        service_id
    ),

    FOREIGN KEY(promotion_id)
        REFERENCES promotions(id),

    FOREIGN KEY(service_id)
        REFERENCES services(id)

);

CREATE TABLE testimonials (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    customer_name VARCHAR(255),

    customer_id BIGINT UNSIGNED NULL,

    company_name VARCHAR(255),

    designation VARCHAR(255),

    testimonial_text LONGTEXT,

    rating DECIMAL(2,1),

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    website_active TINYINT(1) DEFAULT 1,

    featured TINYINT(1) DEFAULT 0,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),
    FOREIGN KEY(customer_id)
        REFERENCES customers(id)

);

CREATE TABLE clients (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    client_name VARCHAR(255),

    website_url VARCHAR(500),

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    website_active TINYINT(1) DEFAULT 1,
    
    industry VARCHAR(255) NULL,

    short_description TEXT NULL,

    featured TINYINT(1) DEFAULT 0,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)

);

CREATE TABLE inquiry_forms (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    form_name VARCHAR(255) NOT NULL,

    form_code VARCHAR(100) UNIQUE NOT NULL,

    form_description TEXT,

    success_message TEXT,

    redirect_url VARCHAR(500),

    send_admin_email TINYINT(1) DEFAULT 1,

    send_customer_copy TINYINT(1) DEFAULT 0,

    customer_email_field_id BIGINT UNSIGNED NULL,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,

    website_active TINYINT(1) DEFAULT 1,

    created_by BIGINT UNSIGNED NULL,

    internal_notes LONGTEXT NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)
);

CREATE TABLE inquiry_form_fields (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    form_id BIGINT UNSIGNED NOT NULL,

    field_label VARCHAR(255) NOT NULL,

    field_name VARCHAR(255) NOT NULL,

    field_type ENUM(
        'text',
        'textarea',
        'email',
        'number',
        'phone',
        'url',
        'date',
        'datetime',
        'select',
        'radio',
        'checkbox',
        'file',
        'hidden',
        'heading',
        'html'
    ),

    placeholder VARCHAR(255),

    default_value TEXT,

    is_required TINYINT(1) DEFAULT 0,

    is_unique TINYINT(1) DEFAULT 0,

    display_order INT DEFAULT 0,

    width ENUM(
        '25',
        '50',
        '75',
        '100'
    ) DEFAULT '100',

    validation_regex TEXT NULL,

    help_text TEXT,

    is_active TINYINT(1) DEFAULT 1,

    FOREIGN KEY(form_id)
        REFERENCES inquiry_forms(id)
        ON DELETE CASCADE
);

CREATE TABLE inquiry_form_field_options (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    field_id BIGINT UNSIGNED NOT NULL,

    option_label VARCHAR(255),

    option_value VARCHAR(255),

    display_order INT DEFAULT 0,

    FOREIGN KEY(field_id)
        REFERENCES inquiry_form_fields(id)
        ON DELETE CASCADE
);

CREATE TABLE inquiry_email_recipients (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    form_id BIGINT UNSIGNED NOT NULL,

    recipient_name VARCHAR(255),

    recipient_email VARCHAR(255),

    is_active TINYINT(1) DEFAULT 1,

    FOREIGN KEY(form_id)
        REFERENCES inquiry_forms(id)
        ON DELETE CASCADE
);

CREATE TABLE inquiry_email_templates (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    form_id BIGINT UNSIGNED NOT NULL,

    template_type ENUM(
        'admin_notification',
        'customer_copy'
    ),

    email_subject VARCHAR(500),

    email_body LONGTEXT,

    is_active TINYINT(1) DEFAULT 1,

    FOREIGN KEY(form_id)
        REFERENCES inquiry_forms(id)
        ON DELETE CASCADE
);

CREATE TABLE inquiry_submissions (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    form_id BIGINT UNSIGNED NOT NULL,

    customer_id BIGINT UNSIGNED NULL,

    ip_address VARCHAR(100),

    user_agent TEXT,

    status_id BIGINT UNSIGNED NULL,

    submitted_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    assigned_to BIGINT UNSIGNED NULL,

    assigned_at DATETIME NULL,

    FOREIGN KEY(form_id)
        REFERENCES inquiry_forms(id),

    FOREIGN KEY(customer_id)
        REFERENCES customers(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);

CREATE TABLE inquiry_submission_values (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    submission_id BIGINT UNSIGNED NOT NULL,

    field_id BIGINT UNSIGNED NOT NULL,

    submitted_value LONGTEXT,

    FOREIGN KEY(submission_id)
        REFERENCES inquiry_submissions(id)
        ON DELETE CASCADE,

    FOREIGN KEY(field_id)
        REFERENCES inquiry_form_fields(id)
);

CREATE TABLE inquiry_submission_files (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    submission_id BIGINT UNSIGNED NOT NULL,

    field_id BIGINT UNSIGNED NOT NULL,

    media_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY(submission_id)
        REFERENCES inquiry_submissions(id)
        ON DELETE CASCADE,

    FOREIGN KEY(field_id)
        REFERENCES inquiry_form_fields(id),

    FOREIGN KEY(media_id)
        REFERENCES media_library(id)
);

CREATE TABLE inquiry_followups (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    submission_id BIGINT UNSIGNED NOT NULL,

    assigned_to BIGINT UNSIGNED NULL,

    followup_note LONGTEXT,

    next_followup_date DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(submission_id)
        REFERENCES inquiry_submissions(id),

    FOREIGN KEY(assigned_to)
        REFERENCES users(id)
);

CREATE TABLE package_feature_groups (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    package_id BIGINT UNSIGNED NOT NULL,

    group_name VARCHAR(255),

    display_order INT DEFAULT 0,

    FOREIGN KEY(package_id)
        REFERENCES service_packages(id)
        ON DELETE CASCADE
);