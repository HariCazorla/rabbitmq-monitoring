# rabbitmq-monitoring
A distributed RabbitMQ monitoring setup using Prometheus and Grafana.

## To run single instance run

```
make start
```

## To run a cluster of 3 nodes run

```
make start-cluster
```

Once all the containers are up and running, run

```
./setup-cluster.sh
```

## To cleanup

```
make end
```

## To cleanup cluster

```
make end-cluster
```
