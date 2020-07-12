## 🌶 flask and hot-reload
flask:
	docker-compose run --rm -e FLASK_APP=app.py -e FLASK_ENV=development --service-ports flask-server flask run --host 0.0.0.0

flaskdebug:
	docker-compose run --rm -e DEBUGGER=True -e FLASK_APP=app.py -e FLASK_ENV=development --service-ports flask-server flask run --host 0.0.0.0

## 🦄 gunicorn and hot-reload
gunicorn:
	docker-compose run --rm --service-ports flask-server gunicorn --reload --bind 0.0.0.0:5000 app:app

gunicorndebug:
	docker-compose run --rm -e DEBUGGER=True --service-ports flask-server gunicorn --reload --bind 0.0.0.0:5000 --timeout 3600 app:app