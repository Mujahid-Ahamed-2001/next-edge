

CREATE TABLE blog_media (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    blog_id BIGINT UNSIGNED,

    media_id BIGINT UNSIGNED,

    media_type ENUM(
        'thumbnail',
        'gallery',
        'content'
    ),

    sort_order INT DEFAULT 0,

    FOREIGN KEY(media_id)
        REFERENCES media_library(id)
);

CREATE TABLE service_media (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    service_id BIGINT UNSIGNED,

    media_id BIGINT UNSIGNED,

    media_type ENUM(
        'thumbnail',
        'gallery',
        'package'
    ),

    sort_order INT DEFAULT 0,

    FOREIGN KEY(media_id)
        REFERENCES media_library(id)
);

CREATE TABLE portfolio_media (

    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,

    portfolio_id BIGINT UNSIGNED,

    media_id BIGINT UNSIGNED,

    media_type ENUM(
        'thumbnail',
        'gallery'
    ),

    sort_order INT DEFAULT 0,

    FOREIGN KEY(media_id)
        REFERENCES media_library(id)
);