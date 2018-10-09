all: start

up:
	docker-compose up -d

start: up
	docker exec -ti groovebasin bash -c "npm start"

install: up
	docker exec -ti groovebasin bash -c "cp -n config-docker.json config.json"
	docker exec -ti groovebasin bash -c "npm install"
	docker exec -ti groovebasin bash -c "npm run build"
	docker exec -ti groovebasin bash -c "cd node_modules/groove/ && node-gyp rebuild"
	docker exec -ti groovebasin bash -c "cd node_modules/leveldown/ && node-gyp rebuild"

bash: up
	docker exec -ti groovebasin bash

logs:
	docker-compose logs -ft
