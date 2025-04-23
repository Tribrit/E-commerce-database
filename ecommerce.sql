CREATE DATABASE ecommerce;
USE ecommerce;

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


-- Insert data into the brand table
INSERT INTO brand (brand_id, brand_name, website, created_at)
VALUES
(1, 'Brand A', 'https://www.branda.com', NOW()),
(2, 'Brand B', 'https://www.brandb.com', NOW());

-- Insert data into the product_category table
INSERT INTO product_category (category_id, category_name, description, created_at)
VALUES
(1, 'Electronics', 'Electronic gadgets and accessories', NOW()),
(2, 'Clothing', 'Apparel and fashion items', NOW());

-- Insert data into the product table
INSERT INTO product (product_id, name, brand_id, base_price, description, category_id, created_at)
VALUES
(1, 'Smartphone', 1, 699.99, 'High-quality smartphone', 1, NOW()),
(2, 'T-shirt', 2, 19.99, 'Comfortable cotton T-shirt', 2, NOW());

-- Insert data into the product_image table
INSERT INTO product_image (productimage_id, product_id, image_url, alt_text, created_at)
VALUES
(1, 1, 'https://www.example.com/image1.jpg', 'Smartphone image', NOW()),
(2, 2, 'https://www.example.com/image2.jpg', 'T-shirt image', NOW());

-- Insert data into the product_item table
INSERT INTO product_item (product_item_id, product_id, sku, stock_quantity, price, created_at)
VALUES
(1, 1, 'SMARTPHONE123', 50, 699.99, NOW()),
(2, 2, 'TSHIRT456', 100, 19.99, NOW());

-- Insert data into the color table
INSERT INTO color (color_id, color_name, hex_code, created_at)
VALUES
(1, 'Red', '#FF0000', NOW()),
(2, 'Blue', '#0000FF', NOW());

-- Insert data into the size_category table
INSERT INTO size_category (size_category_id, category_name, description, created_at)
VALUES
(1, 'Clothing Sizes', 'Sizes for apparel', NOW());

-- Insert data into the size_option table
INSERT INTO size_option (size_option_id, size_category_id, size_label, created_at)
VALUES
(1, 1, 'Small', NOW()),
(2, 1, 'Medium', NOW());

-- Insert data into the product_variation table
INSERT INTO product_variation (product_variation_id, product_item_id, size_option_id, color_id, created_at)
VALUES
(1, 2, 1, 1, NOW()),
(2, 2, 2, 2, NOW());

-- Insert data into the attribute_category table
INSERT INTO attribute_category (attribute_category_id, category_name, created_at)
VALUES
(1, 'Technical', NOW());

-- Insert data into the attribute_type table
INSERT INTO attribute_type (attribute_type_id, type_name)
VALUES
(1, 'Processor'),
(2, 'RAM');

-- Insert data into the product_attribute table
INSERT INTO product_attribute (product_attribute_id, product_id, attribute_type_id, value, created_at)
VALUES
(1, 1, 1, 'Octa-Core', NOW()),
(2, 1, 2, '8GB', NOW());