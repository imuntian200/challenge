USE `cryptocurrencies`;

# ================================================================================================

ALTER TABLE `currency_rates` ADD FOREIGN KEY (`id_currency`) REFERENCES `currencies`(`id`);



