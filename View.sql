-- Users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

-- Transactions table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    transaction_date DATE,
    amount DECIMAL(10, 2),
    description VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Inserting sample data into users table
INSERT INTO users (user_id, username, email)
VALUES
    (1, 'john_doe', 'john.doe@example.com'),
    (2, 'jane_smith', 'jane.smith@example.com'),
    (3, 'bob_jones', 'bob.jones@example.com');

-- Inserting sample data into transactions table
INSERT INTO transactions (transaction_id, user_id, transaction_date, amount, description)
VALUES
    (1, 1, '2024-06-01', 100.00, 'Purchase at Grocery Store'),
    (2, 2, '2024-06-02', 50.25, 'Online purchase - Electronics'),
    (3, 1, '2024-06-03', 75.50, 'Dinner at Restaurant'),
    (4, 3, '2024-06-05', 200.00, 'Monthly Rent Payment');


	select * from users;
	select * from transactions;

	drop view user_transectio_summery

create view user_transection_summery as
select u.user_id, u.username, u.email, COUNT(t.transaction_id) from users u left join transactions t on u.user_id=t.user_id group by u.user_id, u.username, u.email;

select * from user_transectio_summery


-- Creating a view to show user details with total transaction amounts
CREATE VIEW user_transaction_summary AS
SELECT u.user_id, u.username, u.email, COUNT(t.transaction_id) AS num_transactions, SUM(t.amount) AS total_spent
FROM users u
LEFT JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.user_id, u.username, u.email;


select * from user_transaction_summary where num_transactions=1;

select * from user_transaction_summary group by  total_spent limit 1;
SELECT *
FROM user_transaction_summary
ORDER BY total_spent DESC
LIMIT 1;

select * from user_transaction_summary where 1=1;


SELECT u.username, COUNT(t.transaction_id) AS num_transactions
FROM users u
LEFT JOIN transactions t ON u.user_id = t.user_id
GROUP BY u.username;
