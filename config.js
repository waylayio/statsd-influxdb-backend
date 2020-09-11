module.exports = {
  port: 8125,

  backends: [ 'statsd-influxdb-backend' ],

  influxdb: {
    host: 'localhost',
    port: 8086,
    version: 0.11,
    ssl: false,
    database: 'statsd',
    username: 'test',
    password: 'testing',
    retentionPolicy: 'default',
    flush: {
      enable: true
    },
    includeStatsdMetrics: true,
    includeInfluxdbMetrics: true
  },

  flushInterval: 3000,
  // for allowing InfluxDB tags to be included in the key name
  keyNameSanitize: false,
  deleteGauges: true,
  deleteTimers: true,
  deleteSets: true
}
