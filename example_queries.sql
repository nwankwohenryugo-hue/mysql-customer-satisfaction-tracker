-- Useful example queries for mysql-customer-satisfaction-tracker
-- Run these after loading schema + sample data

USE customer_satisfaction;

-- 1. View all feedback (newest first)
SELECT 
    id,
    COALESCE(customer_name, 'Anonymous') AS name,
    rating,
    LEFT(comment, 80) AS short_comment,   -- limit length for readability
    submitted_at
FROM feedback
ORDER BY submitted_at DESC;

-- 2. Average satisfaction score
SELECT ROUND(AVG(rating), 2) AS average_rating
FROM feedback;

-- 3. Count per rating level
SELECT 
    rating,
    COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM feedback), 1) AS percentage
FROM feedback
GROUP BY rating
ORDER BY rating DESC;

-- 4. Show low ratings only (≤ 3 stars) – customers who need follow-up
SELECT 
    COALESCE(customer_name, 'Anonymous') AS name,
    rating,
    comment,
    submitted_at
FROM feedback
WHERE rating <= 3
ORDER BY rating ASC, submitted_at DESC;

-- 5. Percentage of satisfied customers (4–5 stars)
SELECT 
    ROUND(
        SUM(CASE WHEN rating >= 4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        1
    ) AS satisfied_percentage
FROM feedback;

-- 6. Most recent 5 entries
SELECT 
    COALESCE(customer_name, 'Anonymous') AS name,
    rating,
    LEFT(comment, 60) AS comment_preview,
    DATE(submitted_at) AS date
FROM feedback
ORDER BY submitted_at DESC
LIMIT 5;
