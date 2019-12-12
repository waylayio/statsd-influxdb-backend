StatsD InfluxDB backend
-----------------------

A fork of [https://github.com/bernd/statsd-influxdb-backend](https://github.com/bernd/statsd-influxdb-backend) with support for influxDB v0.11 and v0.12.

## Tags

Add tags to your metric by using a similar syntax to the influx line protocol.

For this to work you will need to disable `keyNameSanitize` in statsd configuration, see [https://github.com/etsy/statsd/blob/master/exampleConfig.js#L70](https://github.com/etsy/statsd/blob/master/exampleConfig.js#L70).

`echo "foo.bar,hello=world,baz=qux:1|c" | nc -u -w1 localhost`

This will increment the `foo.bar` counter and add the `hello` and `baz` tags to the metric.

## Docker

- Make:
```
make && make publish
```

- Run: 
Mount the config.js and run with command below

```
docker run -p 0.0.0.0:8125:8125/udp --name waylay-statsd -v config.js:/usr/src/app/config.js eu.gcr.io/quiet-mechanic-140114/waylay-statsd:latest
```

Config example: 
```
module.exports = {
  port: 8125,

  backends: [ 'statsd-influxdb-backend' ],

  influxdb: {
    host: 'you-influx-host',
    port: 8086,
    version: 0.11,
    ssl: false,
    database: 'your-influx-db',
    username: 'your-influx-user',
    password: 'your-influx-password',
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
```
