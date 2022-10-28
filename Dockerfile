FROM keymetrics/pm2:12-alpine

# Install app dependencies

# A wildcard is used to ensure both package.json, package-lock.json and yarn.lock are copied.

# It's done before anything to create a reusable docker layer for dependencies

RUN apk add --no-cache git

ENV NPM_CONFIG_LOGLEVEL warn

COPY package*.json ./

RUN npm ci --production

# Bundle APP files

COPY . .

# Expose the listening port of your app

EXPOSE $PORT

# start ecosystem

CMD [ "pm2-runtime", "start", "ecosystem.config.js" ]