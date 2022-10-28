DROP DATABASE IF EXISTS `cryptocurrencies`;
CREATE DATABASE `cryptocurrencies` CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `cryptocurrencies`;

DROP USER IF EXISTS `cryptocurrencies`;
CREATE USER `cryptocurrencies`;

/* GRANT ALL PRIVILEGES ON cryptocurrencies.* To 'cryptocurrencies'@'localhost' IDENTIFIED BY 'Unq3u9DdYg2P7efG';
GRANT ALL PRIVILEGES ON cryptocurrencies.* To 'cryptocurrencies'@'%' IDENTIFIED BY 'Unq3u9DdYg2P7efG'; */
