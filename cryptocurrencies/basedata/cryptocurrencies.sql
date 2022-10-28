USE `cryptocurrencies`;

# ================================================================================================

INSERT INTO `currencies`(`description`, `symbol`) VALUES
    ('bitcoin', 'BTC'),
    ('ethereum', 'ETH'),
    ('cardano', 'ADA');

# ================================================================================================

INSERT INTO `currency_rates`(`id_currency`, `value`) VALUES
    (1, 108.313553),
    (2, 208.313553),
    (3, 308.313553);
