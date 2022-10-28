const Base = require('steplix-microservice/server/routes');
const { database } = require('steplix-microservice');

class Route extends Base {
    /**
     * Handle request
     */
     handler(req) {
        return database.models.CurrencyRates.find({
          with: ["currency"],
          order: [["created_at", "DESC"]],
        }).then((model) => {
            console.log(model);
          if (!model) {
            throw new errors.NotFound(`Not found model ${id}`);
          }
          return model.filter(
            (model) => model.currency.symbol === req.params.symbol.toUpperCase()
          )[0];
        });
      }
}

module.exports = (new Route()).handlerize();

