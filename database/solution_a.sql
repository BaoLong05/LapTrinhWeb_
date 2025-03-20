-- Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT * FROM users ORDER BY user_name ASC;

-- Lấy ra 07 người dùng theo thứ tự tên theo Alphabet (A->Z)
SELECT TOP 7 * FROM users ORDER BY user_name ASC;


-- Lấy ra danh sách người dùng theo thứ tự tên theo Alphabet (A->Z), trong đó tên người dùng có chữ 'a'
SELECT * FROM users WHERE user_name LIKE '%a%' ORDER BY user_name ASC;

-- Lấy ra danh sách người dùng trong đó tên người dùng bắt đầu bằng chữ 'm'
SELECT * FROM users WHERE user_name LIKE 'm%';

-- Lấy ra danh sách người dùng trong đó tên người dùng kết thúc bằng chữ 'i'
SELECT * FROM users WHERE user_name LIKE '%i';

-- Lấy ra danh sách người dùng trong đó email người dùng là Gmail
SELECT * FROM users WHERE user_email LIKE '%@gmail.com';

-- Lấy ra danh sách người dùng trong đó email là Gmail và tên bắt đầu bằng 'm'
SELECT * FROM users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE 'm%';

-- Lấy ra danh sách người dùng trong đó email là Gmail, tên có chữ 'i' và dài hơn 5 ký tự
SELECT * FROM users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE '%i%' AND LEN(user_name) > 5;

-- Lấy ra danh sách người dùng có tên chứa 'a', dài từ 5 đến 9 ký tự, email Gmail, và tên email chứa 'i'
SELECT * FROM users 
WHERE user_name LIKE '%a%' 
AND LEN(user_name) BETWEEN 5 AND 9 
AND user_email LIKE '%@gmail.com' 
AND CHARINDEX('i', LEFT(user_email, CHARINDEX('@', user_email) - 1)) > 0;

-- Lấy ra danh sách người dùng có tên chứa 'a' dài từ 5 đến 9 ký tự, hoặc tên chứa 'i' dài nhỏ hơn 9 ký tự, hoặc email Gmail có chữ 'i' trong phần tên
SELECT * FROM users 
WHERE 
    (user_name LIKE '%a%' AND LEN(user_name) BETWEEN 5 AND 9) 
    OR (user_name LIKE '%i%' AND LEN(user_name) < 9) 
    OR (user_email LIKE '%@gmail.com' AND CHARINDEX('i', LEFT(user_email, CHARINDEX('@', user_email) - 1)) > 0);

