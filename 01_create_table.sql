CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    origin VARCHAR(50),
    destination VARCHAR(50),
    shipping_mode VARCHAR(30),
    order_date DATE,
    ship_date DATE,
    delivery_date DATE,
    scheduled_delivery_date DATE,
    shipping_cost DECIMAL(10,2),
    shipment_status VARCHAR(30)
);
