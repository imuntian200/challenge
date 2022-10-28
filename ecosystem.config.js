'use strict';

const os = require('os');
const pkg = require('./package.json');

const APP_MAIN = pkg.main;
const APP_NAME = pkg.name;

const ENVIRONMENT = process.env.NODE_ENV || 'production';
const INSTANCES = process.env.APP_INSTANCES ? process.env.APP_INSTANCES : (ENVIRONMENT === 'development' ? 1 : os.cpus().length);

module.exports = {
    apps: [{
        name: APP_NAME,
        script: APP_MAIN,
        cwd: './',
        instances: INSTANCES,
        exec_mode: 'cluster',
        env: {},
        env_development: {
            NODE_ENV: 'development',
            LOG_ERROR_STACK: 1,
            watch: 'true',
            ignore_watch: ['node_modules', 'tests']
        }
    }]
};
