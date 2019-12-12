FROM statsd/statsd:v0.8.2

RUN mkdir /usr/src/app/node_modules/statsd-influxdb-backend
COPY . /usr/src/app/node_modules/statsd-influxdb-backend/

ENTRYPOINT [ "node", "stats.js", "config.js" ]
