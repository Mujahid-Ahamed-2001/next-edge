SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS workflow_execution_logs;

DROP TABLE IF EXISTS workflow_automations;

DROP TABLE IF EXISTS audit_logs;

DROP TABLE IF EXISTS email_logs;

DROP TABLE IF EXISTS api_logs;

DROP TABLE IF EXISTS notifications;

DROP TABLE IF EXISTS portfolio_views;

DROP TABLE IF EXISTS portfolio_category_relations;

DROP TABLE IF EXISTS portfolio_contents;

DROP TABLE IF EXISTS portfolios;

DROP TABLE IF EXISTS portfolio_categories;

DROP TABLE IF EXISTS blog_views;

DROP TABLE IF EXISTS blog_category_relations;

DROP TABLE IF EXISTS blog_contents;

DROP TABLE IF EXISTS blogs;

DROP TABLE IF EXISTS blog_categories;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE blog_categories (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    parent_id BIGINT UNSIGNED NULL,

    category_name VARCHAR(255) NOT NULL,

    slug VARCHAR(255) NOT NULL UNIQUE,

    description TEXT NULL,

    status_id BIGINT UNSIGNED NULL,

    is_active TINYINT(1) DEFAULT 1,
    website_active TINYINT(1) DEFAULT 1,
    featured TINYINT(1) DEFAULT 0,

    is_deleted TINYINT(1) DEFAULT 0,
    deleted_at DATETIME NULL,

    created_by BIGINT UNSIGNED NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY(parent_id)
        REFERENCES blog_categories(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id)
);

CREATE TABLE blogs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(500) NOT NULL,

    slug VARCHAR(500) NOT NULL UNIQUE,

    short_description TEXT,

    content LONGTEXT,

    author_id BIGINT UNSIGNED NULL,

    published_at DATETIME NULL,

    view_count BIGINT UNSIGNED DEFAULT 0,

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

    FOREIGN KEY(author_id)
        REFERENCES users(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id),

    FOREIGN KEY(updated_by)
        REFERENCES users(id)
);

CREATE TABLE blog_contents (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    blog_id BIGINT UNSIGNED NOT NULL,

    content_type ENUM(
        'text',
        'image',
        'video',
        'html'
    ),

    content LONGTEXT,

    display_order INT DEFAULT 0,

    FOREIGN KEY(blog_id)
        REFERENCES blogs(id)
        ON DELETE CASCADE
);

CREATE TABLE blog_category_relations (

    blog_id BIGINT UNSIGNED NOT NULL,

    category_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY(blog_id, category_id),

    FOREIGN KEY(blog_id)
        REFERENCES blogs(id)
        ON DELETE CASCADE,

    FOREIGN KEY(category_id)
        REFERENCES blog_categories(id)
        ON DELETE CASCADE
);

CREATE TABLE blog_views (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    blog_id BIGINT UNSIGNED NOT NULL,

    ip_address VARCHAR(100),

    country VARCHAR(150),

    city VARCHAR(150),

    user_agent TEXT,

    viewed_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(blog_id)
        REFERENCES blogs(id)
        ON DELETE CASCADE
);

CREATE TABLE portfolio_categories (

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

    FOREIGN KEY(parent_id)
        REFERENCES portfolio_categories(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id)
);

CREATE TABLE portfolios (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(500) NOT NULL,

    slug VARCHAR(500) NOT NULL UNIQUE,

    short_description TEXT,

    content LONGTEXT,

    client_id BIGINT UNSIGNED NULL,

    project_url VARCHAR(1000),

    completion_date DATE NULL,

    view_count BIGINT UNSIGNED DEFAULT 0,

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

    FOREIGN KEY(client_id)
        REFERENCES clients(id),

    FOREIGN KEY(status_id)
        REFERENCES statuses(id),

    FOREIGN KEY(created_by)
        REFERENCES users(id),

    FOREIGN KEY(updated_by)
        REFERENCES users(id)
);

CREATE TABLE portfolio_contents (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    portfolio_id BIGINT UNSIGNED NOT NULL,

    content_type ENUM(
        'text',
        'image',
        'video',
        'html'
    ),

    content LONGTEXT,

    display_order INT DEFAULT 0,

    FOREIGN KEY(portfolio_id)
        REFERENCES portfolios(id)
        ON DELETE CASCADE
);

CREATE TABLE portfolio_category_relations (

    portfolio_id BIGINT UNSIGNED NOT NULL,

    category_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY(portfolio_id, category_id),

    FOREIGN KEY(portfolio_id)
        REFERENCES portfolios(id)
        ON DELETE CASCADE,

    FOREIGN KEY(category_id)
        REFERENCES portfolio_categories(id)
        ON DELETE CASCADE
);

CREATE TABLE portfolio_views (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    portfolio_id BIGINT UNSIGNED NOT NULL,

    ip_address VARCHAR(100),

    country VARCHAR(150),

    city VARCHAR(150),

    user_agent TEXT,

    viewed_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(portfolio_id)
        REFERENCES portfolios(id)
        ON DELETE CASCADE
);

CREATE TABLE notifications (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    user_id BIGINT UNSIGNED NOT NULL,

    title VARCHAR(255) NOT NULL,

    message LONGTEXT,

    notification_type VARCHAR(100),

    reference_type VARCHAR(100),

    reference_id BIGINT UNSIGNED NULL,

    is_read TINYINT(1) DEFAULT 0,

    read_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(user_id)
        REFERENCES users(id)
);

CREATE TABLE api_logs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    endpoint VARCHAR(500),

    request_method VARCHAR(20),

    request_headers LONGTEXT,

    request_body LONGTEXT,

    response_code INT,

    response_body LONGTEXT,

    ip_address VARCHAR(100),

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE email_logs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    recipient_email VARCHAR(255),

    subject VARCHAR(500),

    email_body LONGTEXT,

    status ENUM(
        'pending',
        'sent',
        'failed'
    ) DEFAULT 'pending',

    error_message LONGTEXT NULL,

    sent_at DATETIME NULL,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE audit_logs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    table_name VARCHAR(255),

    record_id BIGINT UNSIGNED,

    action_type ENUM(
        'insert',
        'update',
        'delete'
    ),

    old_values LONGTEXT,

    new_values LONGTEXT,

    changed_by BIGINT UNSIGNED NULL,

    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(changed_by)
        REFERENCES users(id)
);

CREATE TABLE workflow_automations (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    workflow_name VARCHAR(255),

    trigger_module VARCHAR(100),

    trigger_event VARCHAR(100),

    action_type VARCHAR(100),

    action_configuration LONGTEXT,

    is_active TINYINT(1) DEFAULT 1,

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE workflow_execution_logs (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    workflow_id BIGINT UNSIGNED NOT NULL,

    reference_type VARCHAR(100),

    reference_id BIGINT UNSIGNED,

    execution_status ENUM(
        'success',
        'failed'
    ),

    response_message LONGTEXT,

    executed_at DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(workflow_id)
        REFERENCES workflow_automations(id)
);