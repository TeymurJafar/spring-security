CREATE SCHEMA IF NOT EXISTS security_db;

USE security_db;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE employee (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          first_name VARCHAR(255) NOT NULL,
                          last_name VARCHAR(255) NOT NULL,
                          email VARCHAR(255) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE users (
                       `username` varchar(50) NOT NULL,
                       `password` varchar(50) NOT NULL,
                       `enabled` tinyint NOT NULL,
                       PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users`
VALUES
    ('Teymur','{noop}test123',1),
    ('Tural','{noop}test123',1),
    ('Cavid','{noop}test123',1);


CREATE TABLE `authorities` (
                               `username` varchar(50) NOT NULL,
                               `authority` varchar(50) NOT NULL,
                               UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
                               CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `authorities`
VALUES
    ('Teymur','ROLE_EMPLOYEE'),
    ('Tural','ROLE_EMPLOYEE'),
    ('Tural','ROLE_MANAGER'),
    ('Cavid','ROLE_EMPLOYEE'),
    ('Cavid','ROLE_MANAGER'),
    ('Cavid','ROLE_ADMIN');


