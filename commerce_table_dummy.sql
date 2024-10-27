drop table  customer;
drop table "order";
drop table region;
drop table product;

CREATE TABLE customer (
    customer_code  VARCHAR2(50 CHAR) NOT NULL,
    customer_name  VARCHAR2(30 CHAR) NOT NULL,
    phone_number   VARCHAR2(20 CHAR) unique NOT NULL,
    email          VARCHAR2(30 CHAR) unique NOT NULL,
    address        VARCHAR2(100 CHAR),
    regist_date    DATE,
    region_code    VARCHAR2(3 CHAR) NOT NULL
);

COMMENT ON COLUMN customer.customer_code IS
    '고객코드';

COMMENT ON COLUMN customer.customer_name IS
    '고객이름';

COMMENT ON COLUMN customer.phone_number IS
    '전화번호';

COMMENT ON COLUMN customer.email IS
    '이메일';

COMMENT ON COLUMN customer.address IS
    '주소';

COMMENT ON COLUMN customer.regist_date IS
    '가입일';

COMMENT ON COLUMN customer.region_code IS
    '지역코드(외래키)';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_code );

CREATE TABLE "order" (
    order_code     VARCHAR2(50 CHAR) NOT NULL,
    quantity       NUMBER(10),
    order_date     DATE NOT NULL,
    customer_code  VARCHAR2(50 CHAR) NOT NULL,
    product_code   VARCHAR2(50 CHAR) NOT NULL
);

COMMENT ON COLUMN "order".order_code IS
    '주문코드';

COMMENT ON COLUMN "order".quantity IS
    '주문수량';

COMMENT ON COLUMN "order".order_date IS
    '주문일자
기본값 : sysdate';

COMMENT ON COLUMN "order".customer_code IS
    '고객코드
참조키';

ALTER TABLE "order"
    ADD CONSTRAINT order_pk PRIMARY KEY ( order_code,
                                          customer_code,
                                          product_code );

CREATE TABLE region (
    region_code  VARCHAR2(3 CHAR) NOT NULL,
    region_name  VARCHAR2(10 CHAR) NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( region_code );

CREATE TABLE product (
    product_code  VARCHAR2(50 CHAR) NOT NULL,
    product_name  VARCHAR2(50 CHAR) NOT NULL,
    price         NUMBER(17, 3)
);

COMMENT ON COLUMN product.product_code IS
    '제품코드';

COMMENT ON COLUMN product.product_name IS
    '제품이름';

COMMENT ON COLUMN product.price IS
    '가격';

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( product_code );

ALTER TABLE "order"
    ADD CONSTRAINT customer_order_fk FOREIGN KEY ( customer_code )
        REFERENCES customer ( customer_code );

ALTER TABLE "order"
    ADD CONSTRAINT order_product_fk FOREIGN KEY ( product_code )
        REFERENCES product ( product_code );

ALTER TABLE customer
    ADD CONSTRAINT region_customer_fk FOREIGN KEY ( region_code )
        REFERENCES region ( region_code );