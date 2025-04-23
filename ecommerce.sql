
CREATE TABLE brand (
    brand_id INT NOT NULL PRIMARY KEY,
    brand_name VARCHAR(255),
    website VARCHAR(255),
    created_at DATETIME
);

CREATE TABLE product_category (
    category_id INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT,
    created_at DATETIME
);

CREATE TABLE product (
    product_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(255),
    brand_id INT,
    base_price DECIMAL(10, 2),
    description TEXT,
    category_id INT,
    created_at DATETIME,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE product_image (
    productimage_id INT NOT NULL PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    alt_text VARCHAR(255),
    created_at DATETIME,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE product_item (
    product_item_id INT NOT NULL PRIMARY KEY,
    product_id INT,
    sku VARCHAR(255),
    stock_quantity INT,
    price DECIMAL(10, 2),
    created_at DATETIME,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE color (
    color_id INT NOT NULL PRIMARY KEY,
    color_name VARCHAR(255),
    hex_code VARCHAR(10),
    created_at DATETIME
);

CREATE TABLE size_category (
    size_category_id INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT,
    created_at DATETIME
);

CREATE TABLE size_option (
    size_option_id INT NOT NULL PRIMARY KEY,
    size_category_id INT,
    size_label VARCHAR(50),
    created_at DATETIME,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

CREATE TABLE product_variation (
    product_variation_id INT NOT NULL PRIMARY KEY,
    product_item_id INT,
    size_option_id INT,
    color_id INT,
    created_at DATETIME,
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

CREATE TABLE attribute_category (
    attribute_category_id INT NOT NULL PRIMARY KEY,
    category_name VARCHAR(255),
    created_at DATETIME
);

CREATE TABLE attribute_type (
    attribute_type_id INT NOT NULL PRIMARY KEY,
    type_name VARCHAR(255)
);

CREATE TABLE product_attribute (
    product_attribute_id INT NOT NULL PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    value VARCHAR(255),
    created_at DATETIME,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
