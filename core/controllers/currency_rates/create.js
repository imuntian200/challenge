const Base = require('steplix-microservice/server/routes');
const { errors, database } = require('steplix-microservice');
const _ = require('lodash');



class Route extends Base {

    validate(req) {
        if (_.isEmpty(req.body)) {
          throw new errors.BadRequest('Bad request. Please set body parameters');
        }
        if (!validator.isNumber(req.body.value)) {
          throw new errors.BadRequest('Bad request. Please use "value" on body parameters');
        }
        if (!validator.isNumber(req.body.id_currency)) {
          throw new errors.BadRequest('Bad request. Please use "id_currency" on body parameters');
        }
      }
    
    handler(req) {
        const { id_currency, value } = req.body;
        const data = { id_currency, value }
        return database.models.CurrencyRates.create(data).then(currencyRate => {
            if (!currencyRate) {
                throw new errors.InternalServerError('Not save notification');
            }
            return currencyRate;
        })
    }
}

module.exports = (new Route()).handlerize();
