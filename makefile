build:
	docker build . -t notes:latest	
run:
	docker run -e RAILS_ENV=development notes:latest
migrate:
	docker run -it notes:latest bundle db:migrate