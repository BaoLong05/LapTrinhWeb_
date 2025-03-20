INSERT INTO users (user_name, user_email, user_pass)
VALUES 
('Nguyen Van A', 'nguyenvana@gmail.com', 'password123'),
('Tran Thi B', 'tranthib@gmail.com', 'password456'),
('Le Van C', 'levanc@yahoo.com', 'password789'),
('Pham Van D', 'phamvand@hotmail.com', 'abc123'),
('Hoang Thi E', 'hoangthie@gmail.com', 'pass567'),
('Bui Van F', 'buivanf@yahoo.com', 'xyz123'),
('Do Thi G', 'dothig@hotmail.com', 'securepass'),
('Vu Van H', 'vuvanh@gmail.com', 'qwerty789'),
('Nguyen Thi I', 'nguyenthi@yahoo.com', 'password321'),
('Tran Van J', 'tranvanj@gmail.com', 'passabc');

INSERT INTO products (product_name, product_price, product_description)
VALUES 
('Laptop Dell', 1500, 'Laptop Dell XPS 13'),
('iPhone 14', 999, 'Điện thoại iPhone 14 chính hãng'),
('Smart TV Samsung', 1200, 'Tivi Samsung 55 inch 4K'),
('MacBook Pro', 2000, 'MacBook Pro M2 16 inch'),
('AirPods Pro', 250, 'Tai nghe không dây của Apple'),
('Chuột Logitech', 40, 'Chuột không dây Logitech MX Master 3'),
('Bàn phím cơ Razer', 120, 'Bàn phím cơ Razer BlackWidow V3'),
('Màn hình LG', 300, 'Màn hình LG UltraGear 27 inch'),
('Ổ cứng SSD Samsung', 150, 'SSD Samsung 1TB NVMe'),
('Loa Bluetooth JBL', 180, 'Loa không dây JBL Charge 5');

INSERT INTO orders (user_id)
VALUES 
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO order_details (order_id, product_id)
VALUES 
(1, 1),  -- Nguyễn Văn A mua Laptop Dell
(1, 2),  -- Nguyễn Văn A mua iPhone 14
(2, 3),  -- Trần Thị B mua Smart TV Samsung
(3, 4),  -- Lê Văn C mua MacBook Pro
(4, 5),  -- Phạm Văn D mua AirPods Pro
(5, 6),  -- Hoàng Thị E mua Chuột Logitech
(6, 7),  -- Bùi Văn F mua Bàn phím cơ Razer
(7, 8),  -- Đỗ Thị G mua Màn hình LG
(8, 9),  -- Vũ Văn H mua Ổ cứng SSD Samsung
(9, 10); -- Nguyễn Thị I mua Loa Bluetooth JBL

