const Base = require('steplix-microservice/server/routes/list');
const { database, errors } = require('steplix-microservice');

class Route extends Base {

    async handler() {
        try {
          const rates = await database.models.CurrencyRates.query(
            'SELECT `currency_rates`.`id`, `currency_rates`.`id_currency`, `currency_rates`.`value`, `currency_rates`.`created_at`, `currency_rates`.`id_currency`, `currencies`.`id` AS `currency.id`, `currencies`.`description` AS `currency.description`, `currencies`.`symbol` AS `currency.symbol` FROM `currency_rates` INNER JOIN `currencies` on `currency_rates`.`id_currency` = `currencies`.`id` ORDER BY `created_at` ASC',
            {
              nest: true,
            },
          );
          let uniqueRatesArray = [...new Map(rates.map((item) => [item["id_currency"], item])).values()];
          return uniqueRatesArray;
        } catch (error) {
          throw new errors.InternalServerError(error);
        }
      }

}

module.exports = (new Route('CurrencyRates')).handlerize();


