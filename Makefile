start:
	docker-compose up

start-cluster:
	docker-compose -f docker-compose-cluster.yml up

end:
	docker-compose down

end-cluster:
	docker-compose -f docker-compose-cluster.yml down

init-cluster:
	echo "Finding clusters"