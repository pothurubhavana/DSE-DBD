
CREATE DATABASE IF NOT EXISTS campus_lost_found;
USE campus_lost_found;
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    role ENUM('student', 'staff', 'admin') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7)
);
CREATE TABLE IF NOT EXISTS items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    item_type ENUM('lost', 'found') NOT NULL,
    item_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    location_id INT,
    item_date DATE,
    image_url VARCHAR(500),
    status ENUM('open', 'matched', 'claimed', 'returned')
        DEFAULT 'open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_items_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_items_location
        FOREIGN KEY (location_id)
        REFERENCES locations(location_id)
        ON DELETE SET NULL
);

INSERT INTO users
(full_name, email, phone, role)
VALUES
('Bhavana Manaswini', 'bhavana@example.com', '9876543210', 'student'),
('Campus Admin', 'admin@example.com', '9876543211', 'admin');

INSERT INTO locations
(location_name, description, latitude, longitude)
VALUES
('Main Block', 'Main academic building', 16.3738, 80.3490),
('Library', 'Central campus library', 16.3742, 80.3485),
('Canteen', 'Student food court', 16.3745, 80.3495),
('Computer Lab', 'Computer science laboratory', 16.3735, 80.3488),
('Parking Area', 'Main campus parking area', 16.3750, 80.3500);

SELECT DATABASE();

SHOW TABLES;

SELECT * FROM users;

SELECT * FROM locations;

SELECT * FROM items;