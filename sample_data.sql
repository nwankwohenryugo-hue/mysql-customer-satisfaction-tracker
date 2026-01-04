-- Sample data for mysql-customer-satisfaction-tracker
-- Run this AFTER schema.sql

USE customer_satisfaction;

INSERT INTO feedback (customer_name, rating, comment) VALUES
('Emma',     5, 'Amazing support, solved my issue in minutes!'),
('Alex',     4, 'Good overall, but could improve response time.'),
(NULL,       3, 'Average experience – nothing special.'),
('Sophia',   2, 'Product arrived late and packaging was damaged.'),
('Liam',     5, 'Very satisfied, will recommend to friends.'),
('Olivia',   1, 'Extremely disappointed with the service quality.'),
('Noah',     4, 'Helpful team, small things could be better.'),
('Anonymous',5, NULL),                -- quick positive rating, no comment
('Mia',      3, 'It met expectations, but not wow.'),
('James',    4, 'Smooth process, happy customer here.');
