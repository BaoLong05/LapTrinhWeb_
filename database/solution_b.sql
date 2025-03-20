
CREATE PROCEDURE sp_lay_ds_hoa_don
AS
BEGIN
    SELECT o.user_id, u.user_name, o.order_id
    FROM orders o
    JOIN users u ON o.user_id = u.user_id;
END;

exec sp_lay_ds_hoa_don

CREATE PROCEDURE sp_lay_so_luong_hoa_don
AS
BEGIN
    SELECT o.user_id, u.user_name, COUNT(o.order_id) AS so_don_hang
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    GROUP BY o.user_id, u.user_name;
END;


exec sp_lay_so_luong_hoa_don

CREATE PROCEDURE sp_lay_tt_hoa_don
AS
BEGIN
    SELECT o.order_id, COUNT(od.product_id) AS so_san_pham
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.order_id;
END;
exec sp_lay_tt_hoa_don


CREATE PROCEDURE sp_lay_mua_hang
AS
BEGIN
    SELECT o.user_id, u.user_name, o.order_id, STRING_AGG(p.product_name, ', ') AS san_pham
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id
    ORDER BY o.order_id;
END;
exec sp_lay_mua_hang

CREATE PROCEDURE sp_top_7_user_nhieu_don_nhat
AS
BEGIN
    SELECT TOP 7 o.user_id, u.user_name, COUNT(o.order_id) AS so_luong_don_hang
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    GROUP BY o.user_id, u.user_name
    ORDER BY so_luong_don_hang DESC;
END;
exec sp_top_7_user_nhieu_don_nhat

CREATE PROCEDURE sp_top_7_user_mua_samsung_apple
AS
BEGIN
    SELECT DISTINCT TOP 7 o.user_id, u.user_name, o.order_id, p.product_name
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%'
    ORDER BY o.user_id;
END;
exec sp_top_7_user_mua_samsung_apple

CREATE PROCEDURE sp_ds_mua_hang_tong_tien
AS
BEGIN
    SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien
    FROM orders o
    JOIN users u ON o.user_id = u.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id;
END;
exec sp_ds_mua_hang_tong_tien

CREATE PROCEDURE sp_don_hang_gia_cao_nhat
AS
BEGIN
    WITH ranked_orders AS (
        SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien,
               RANK() OVER (PARTITION BY o.user_id ORDER BY SUM(p.product_price) DESC) AS rank
        FROM orders o
        JOIN users u ON o.user_id = u.user_id
        JOIN order_details od ON o.order_id = od.order_id
        JOIN products p ON od.product_id = p.product_id
        GROUP BY o.user_id, u.user_name, o.order_id
    )
    SELECT user_id, user_name, order_id, tong_tien
    FROM ranked_orders
    WHERE rank = 1;
END;

exec sp_don_hang_gia_cao_nhat
CREATE PROCEDURE sp_don_hang_gia_thap_nhat
AS
BEGIN
    WITH ranked_orders AS (
        SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien, COUNT(od.product_id) AS so_san_pham,
               RANK() OVER (PARTITION BY o.user_id ORDER BY SUM(p.product_price) ASC) AS rank
        FROM orders o
        JOIN users u ON o.user_id = u.user_id
        JOIN order_details od ON o.order_id = od.order_id
        JOIN products p ON od.product_id = p.product_id
        GROUP BY o.user_id, u.user_name, o.order_id
    )
    SELECT user_id, user_name, order_id, tong_tien, so_san_pham
    FROM ranked_orders
    WHERE rank = 1;
END;

exec sp_don_hang_gia_thap_nhat
CREATE PROCEDURE sp_don_hang_nhieu_san_pham_nhat
AS
BEGIN
    WITH ranked_orders AS (
        SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS tong_tien, COUNT(od.product_id) AS so_san_pham,
               RANK() OVER (PARTITION BY o.user_id ORDER BY COUNT(od.product_id) DESC) AS rank
        FROM orders o
        JOIN users u ON o.user_id = u.user_id
        JOIN order_details od ON o.order_id = od.order_id
        JOIN products p ON od.product_id = p.product_id
        GROUP BY o.user_id, u.user_name, o.order_id
    )
    SELECT user_id, user_name, order_id, tong_tien, so_san_pham
    FROM ranked_orders
    WHERE rank = 1;
END;

exec sp_don_hang_nhieu_san_pham_nhat