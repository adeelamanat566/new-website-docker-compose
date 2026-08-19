CREATE DATABASE IF NOT EXISTS grocery_db;
USE grocery_db;

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT IGNORE INTO categories (id, name) VALUES
(1, 'Fruits'),
(2, 'Vegetables'),
(3, 'Dairy'),
(4, 'Bakery'),
(5, 'Beverages');

INSERT INTO products (name, price, stock, category_id) VALUES
('Apple', 250.00, 50, 1),
('Banana', 180.00, 70, 1),
('Potato', 150.00, 100, 2),
('Milk', 280.00, 40, 3),
('Bread', 180.00, 35, 4),
('Orange Juice', 450.00, 25, 5);

INSERT INTO customers (name, email, phone) VALUES
('Ali Khan', 'ali@example.com', '03001234567'),
('Sara Ahmed', 'sara@example.com', '03111234567'),
('Hamza Malik', 'hamza@example.com', '03221234567');

INSERT INTO orders (customer_id, total_amount, status) VALUES
(1, 710.00, 'Completed'),
(2, 630.00, 'Pending');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 250.00),
(1, 5, 1, 180.00),
(1, 2, 1, 180.00),
(2, 4, 1, 280.00),
(2, 6, 1, 450.00);
