-- mysql-customer-satisfaction-tracker
-- Simple MySQL schema for tracking customer satisfaction
-- One main table – perfect for beginners learning SQL
-- Created/updated: January 2026

CREATE DATABASE IF NOT EXISTS customer_satisfaction;
USE customer_satisfaction;

-- Main table: customer feedback
CREATE TABLE IF NOT EXISTS feedback (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    customer_name   VARCHAR(100) DEFAULT 'Anonymous',
    rating          TINYINT UNSIGNED NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    submitted_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    INDEX idx_rating (rating)           -- helps speed up average / grouping queries
);
