create database restaurant;

use restaurant;

CREATE TABLE `customers` (
  `first_name` VARCHAR(30) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  `order_time` DATETIME NOT NULL,
  PRIMARY KEY (`order_time`));
  
  CREATE TABLE `order_details` (
  `pizza_type` VARCHAR(30) NOT NULL,
  `quantity` INT NOT NULL,
  `order_time` DATETIME NOT NULL,
  `order_detail_id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_detail_id`));
  
  CREATE TABLE `restaurant`.`pizzas` (
  `pizza_type` VARCHAR(30) NOT NULL,
  `pizza_cost` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`pizza_type`));
  

INSERT INTO `customers` (`first_name`, `last_name`, `phone_number`, `order_time`)
VALUES ('Trevor', 'Page', '226-555-4982', '2014-09-10 09:47:00'),
       ('John', 'Doe', '555-555-9498', '2014-09-10 13:20:00');
	
INSERT INTO `order_details` (`pizza_type`, `quantity`, `order_time`)
VALUES ('Pepperoni & Cheese', 1, '2014-09-10 09:47:00'),
       ('Meat Lovers', 1, '2014-09-10 09:47:00');


INSERT INTO `order_details` (`pizza_type`, `quantity`, `order_time`)
VALUES ('Vegetarian', 1, '2014-09-10 13:20:00'),
       ('Meat Lovers', 2, '2014-09-10 13:20:00');


INSERT INTO `order_details` (`pizza_type`, `quantity`, `order_time`)
VALUES ('Meat Lovers', 1, '2014-09-10 09:47:00'),
       ('Hawaiian', 1, '2014-09-10 09:47:00');
       
INSERT INTO `pizzas` (`pizza_type`, `pizza_cost`)
VALUES ('Pepperoni & Cheese', 7.99),
       ('Vegetarian', 9.99),
       ('Meat Lovers', 14.99),
       ('Hawaiian', 12.99);
       
ALTER TABLE `order_details`
ADD CONSTRAINT `fk_order_customer`
FOREIGN KEY (`order_time`)
REFERENCES `customers` (`order_time`);


ALTER TABLE `order_details`
ADD CONSTRAINT `fk_order_pizza`
FOREIGN KEY (`pizza_type`)
REFERENCES `pizzas` (`pizza_type`);

SELECT c.first_name, c.last_name, SUM(p.pizza_cost * od.quantity) AS total_spent
FROM customers c
JOIN order_details od ON c.order_time = od.order_time
JOIN pizzas p ON od.pizza_type = p.pizza_type
GROUP BY c.first_name, c.last_name
ORDER BY total_spent DESC;

SELECT c.first_name, c.last_name, DATE(od.order_time) AS order_date, SUM(p.pizza_cost * od.quantity) AS total_spent
FROM customers c
JOIN order_details od ON c.order_time = od.order_time
JOIN pizzas p ON od.pizza_type = p.pizza_type
GROUP BY c.first_name, c.last_name, DATE(od.order_time)
ORDER BY c.first_name, c.last_name, order_date, total_spent DESC;



       
       
       





