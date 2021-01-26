influxdb
/usr/bin/influxd -pidfile /var/run/influxdb/influxd.pid -config /etc/influxdb/influxdb.conf
curl "http://127.0.0.1:8086/query" -d "db=foo" -d "chunked=true" -d "q=select * from bar" # export data from influxdb as json format
./etcdctl --endpoints="localhost:2379" get / --keys-only --prefix
./etcdctl --endpoints="localhost:2379" put /foobar "voodoo"
