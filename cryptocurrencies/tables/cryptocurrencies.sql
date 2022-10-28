USE `cryptocurrencies`;

# ================================================================================================

DROP TABLE IF EXISTS `cryptocurrencies`;

CREATE TABLE `currencies` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NOT NULL,
  `symbol` VARCHAR(45) NOT NULL,

  PRIMARY KEY (`id`)
)
ENGINE = InnoDB CHARSET=utf8;

CREATE TABLE `currency_rates` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_currency` INT UNSIGNED NOT NULL,
  `value` REAL NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
    
  PRIMARY KEY (`id`),
  KEY `id_currency` (`id_currency`) 
)
ENGINE = InnoDB CHARSET=utf8;
