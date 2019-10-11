CREATE TABLE rl_customer (
    customer_id     NUMBER(4) NOT NULL,
    customer_name   VARCHAR2(30) NOT NULL,
    st_address      VARCHAR2(20) NOT NULL,
    city            VARCHAR2(20) NOT NULL,
    state           VARCHAR2(20) NOT NULL,
    zipcode         NUMBER(5) NOT NULL
);

COMMENT ON COLUMN rl_customer.customer_id IS
    'CUSTOMER ID';

COMMENT ON COLUMN rl_customer.customer_name IS
    'CUSTOMER NAME';

COMMENT ON COLUMN rl_customer.st_address IS
    'STREET ADDRESS';

COMMENT ON COLUMN rl_customer.city IS
    'CITY';

COMMENT ON COLUMN rl_customer.state IS
    'STATE';

COMMENT ON COLUMN rl_customer.zipcode IS
    'ZIP CODE';

ALTER TABLE rl_customer ADD CONSTRAINT rl_customer_pk PRIMARY KEY ( customer_id );

CREATE TABLE rl_invoice (
    qty          NUMBER(4) NOT NULL,
    order_id     NUMBER(5) NOT NULL,
    product_id   NUMBER(5) NOT NULL
);

COMMENT ON COLUMN rl_invoice.qty IS
    'QUANTITY';

ALTER TABLE rl_invoice ADD CONSTRAINT rl_invoice_pk PRIMARY KEY ( order_id,
                                                                  product_id );

CREATE TABLE rl_orders (
    order_id      NUMBER(5) NOT NULL,
    order_date    DATE NOT NULL,
    customer_id   NUMBER(4)
);

COMMENT ON COLUMN rl_orders.order_id IS
    'ORDER ID';

COMMENT ON COLUMN rl_orders.order_date IS
    'ORDER DATE';

ALTER TABLE rl_orders ADD CONSTRAINT rl_orders_pk PRIMARY KEY ( order_id );

CREATE TABLE rl_product (
    product_id    NUMBER(5) NOT NULL,
    description   VARCHAR2(100) NOT NULL,
    finish        VARCHAR2(30) NOT NULL,
    price         NUMBER(7, 2) NOT NULL,
    order_id      NUMBER
);

COMMENT ON COLUMN rl_product.product_id IS
    'PRODUCT ID';

COMMENT ON COLUMN rl_product.description IS
    'DESCRIPTION';

COMMENT ON COLUMN rl_product.finish IS
    'FINISH';

COMMENT ON COLUMN rl_product.price IS
    'PRICE';

ALTER TABLE rl_product ADD CONSTRAINT rl_product_pk PRIMARY KEY ( product_id );

ALTER TABLE rl_invoice
    ADD CONSTRAINT rl_invoice_rl_orders_fk FOREIGN KEY ( order_id )
        REFERENCES rl_orders ( order_id )
            ON DELETE CASCADE;

ALTER TABLE rl_invoice
    ADD CONSTRAINT rl_invoice_rl_product_fk FOREIGN KEY ( product_id )
        REFERENCES rl_product ( product_id )
            ON DELETE CASCADE;

ALTER TABLE rl_orders
    ADD CONSTRAINT rl_orders_rl_customer_fk FOREIGN KEY ( customer_id )
        REFERENCES rl_customer ( customer_id )
            ON DELETE CASCADE;