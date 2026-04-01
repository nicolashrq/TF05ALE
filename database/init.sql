CREATE TABLE metrics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service VARCHAR(50),
    status BOOLEAN,
    response_time FLOAT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service VARCHAR(50),
    message TEXT,
    level VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);