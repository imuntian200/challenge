'use strict'
require('steplix-microservice/helpers/dependencies');

const database = require('steplix-microservice/database');
const rootDir = process.cwd();
const { health, errors } = require('steplix-microservice/server/routes');
const { app, listen } = require('steplix-microservice/server');
const controllers = require('./controllers');

// Routes
app.get('/currencies', controllers.currencies.list);
app.get('/rates', controllers.currency_rates.list);
app.get('/rates/:symbol', controllers.currency_rates.getRateBySymbol)
app.post('/rates', controllers.currency_rates.create);

//health
health(app, { rootDir, database });

errors(app);

//start server
listen(app);

module.exports = app;