# Fetch container ID of all the rabbitmq instances
rabbitmq_instance_1="$(docker ps | grep 'rabbitmq1' | awk '{print $1}')"
echo "instance1 id $rabbitmq_instance_1"

rabbitmq_instance_2="$(docker ps | grep 'rabbitmq2' | awk '{print $1}')"
echo "instance2 id $rabbitmq_instance_2"

rabbitmq_instance_3="$(docker ps | grep 'rabbitmq3' | awk '{print $1}')"
echo "instance3 id $rabbitmq_instance_3"

# on rabbit2
docker exec -ti $rabbitmq_instance_2 bash -c "rabbitmqctl stop_app"
docker exec -ti $rabbitmq_instance_2 bash -c "rabbitmqctl reset"
docker exec -ti $rabbitmq_instance_2 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq1"
docker exec -ti $rabbitmq_instance_2 bash -c "rabbitmqctl start_app"

# on rabbit3
docker exec -ti $rabbitmq_instance_3 bash -c "rabbitmqctl stop_app"
docker exec -ti $rabbitmq_instance_3 bash -c "rabbitmqctl reset"
docker exec -ti $rabbitmq_instance_3 bash -c "rabbitmqctl join_cluster rabbit@rabbitmq1"
docker exec -ti $rabbitmq_instance_3 bash -c "rabbitmqctl start_app"

# check cluster status
docker exec -ti $rabbitmq_instance_1 bash -c "rabbitmqctl cluster_status"

# check node status
docker exec -ti $rabbitmq_instance_1 bash -c "rabbitmq-diagnostics check_running"
docker exec -ti $rabbitmq_instance_2 bash -c "rabbitmq-diagnostics check_running"
docker exec -ti $rabbitmq_instance_3 bash -c "rabbitmq-diagnostics check_running"
