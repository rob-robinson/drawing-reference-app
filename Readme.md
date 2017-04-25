# Flask in Docker

Fun local flask api starting point using:
 * Docker
 * Python 3.6
 * Flask
 * MySQL


Not production ready !

This is a foundation for having a python rest api available on your local machine

setup_db.sh is available to create a mysql user, schema, and demo data.

add your mysql login information to the app/config.py file.

the database must not be located in the same container as the app.


```

git clone https://github.com/rob-robinson/flask-docker.git

cd flask-docker

# stop and remove all previous containers ( know what these mean before running them ):
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

# build and run container:
docker build -t flask-try . && docker run -d -p 5000:5000 flask-try

curl http://localhost:5000/
curl http://localhost:5000/jwt
curl http://localhost:5000/all/<jwt_token>
curl http://localhost:5000/tag/aladdin
curl http://localhost:5000/tag/moana
curl http://localhost:5000/tag/classic

```