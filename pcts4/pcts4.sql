CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    naame VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL
)

CREATE TABLE zakaz (
    zakaz_id    INT PRIMARY KEY,
    zakaz_date  DATE NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    naame       VARCHAR(200) NOT NULL,
    price      DECIMAL(10, 2) NOT NULL
);

CREATE TABLE zakaz_Item (
    zakaz_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL,
    PRIMARY KEY (zakaz_id, product_id),
    FOREIGN KEY (zakaz_id)  REFERENCES zakaz(zakaz_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);