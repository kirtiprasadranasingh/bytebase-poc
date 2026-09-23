-- 1. Create Core Application Tables
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    sku VARCHAR(50) UNIQUE NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) DEFAULT 'ACTIVE',
    registration_date DATE NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_total DECIMAL(10, 2) NOT NULL,
    order_status VARCHAR(50) DEFAULT 'PROCESSING',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Performance Indexes (Industry Standard for large tables)
CREATE INDEX idx_customers_email ON customers(email);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_status ON orders(order_status);

-- 3. Bulk Insert Realistic Production Data
INSERT INTO products (sku, product_name, price, stock_quantity) VALUES
('TECH-LPT-001', 'MacBook Pro 16-inch M3 Max', 3499.00, 45),
('TECH-MON-089', 'Dell UltraSharp 32 4K Monitor', 899.99, 120),
('ACC-KBD-044', 'Keychron K8 Pro Mechanical Keyboard', 119.50, 300),
('ACC-MSE-012', 'Logitech MX Master 3S', 99.99, 450),
('TECH-TBL-003', 'iPad Pro 12.9-inch', 1099.00, 85);

INSERT INTO customers (email, full_name, registration_date) VALUES
('sarah.connor@example.com', 'Sarah Connor', '2026-01-15'),
('john.smith@enterprise.com', 'John Smith', '2026-02-22'),
('m.chen@startup.io', 'Michael Chen', '2026-03-10'),
('elena.rodriguez@global.net', 'Elena Rodriguez', '2026-04-05'),
('david.kim@techcorp.com', 'David Kim', '2026-05-18');

INSERT INTO orders (customer_id, order_total, order_status) VALUES
(1, 3598.99, 'DELIVERED'),
(1, 119.50, 'SHIPPED'),
(2, 899.99, 'PROCESSING'),
(3, 1198.99, 'DELIVERED'),
(4, 99.99, 'DELIVERED'),
(5, 4598.00, 'PROCESSING');

--goodluck1!
