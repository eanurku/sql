#products
#stores
#sales 
#find sales by stores
#find sales for each product by stores



CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(13,2 )
);

CREATE TABLE stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100)
);

CREATE TABLE sales (
    product_id INT,
    store_id INT,
    quantity DECIMAL(13 , 2 ) NOT NULL,
    sales_date DATE NOT NULL,
    PRIMARY KEY (product_id , store_id),
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES stores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

desc stores;
desc sales;
desc products;

INSERT INTO products(product_name, price)
VALUES('iPhone', 699),
      ('iPad',599),
      ('Macbook Pro',1299);
      
INSERT INTO stores(store_name)
VALUES('North'),
      ('South');

INSERT INTO sales(store_id,product_id,quantity,sales_date)
VALUES(1,1,20,'2017-01-02'),
      (1,2,15,'2017-01-05'),
      (1,3,25,'2017-01-05'),
      (2,1,30,'2017-01-02'),
      (2,2,35,'2017-01-05');

select * from sales;


#find total revenue for each product in each store
select st.store_name,p.product_name,s.quantity ,p.price,p.price*s.quantity as revenue
from sales s
inner join products p ON p.id=s.product_id
inner join stores st ON st.id=s.store_id;


#find total sales by stores
select st.store_name,sum(p.price*s.quantity) as total
from sales s
inner join products p ON p.id=s.product_id
inner join stores st ON st.id=s.store_id
group by st.store_name;

#find a store had no sales of a particular product
select store_name,product_name,IFNULL(price*quantity,0) as revenue from stores s
cross join products p
left join sales  sa
ON sa.product_id= p.id and sa.store_id=s.id;




