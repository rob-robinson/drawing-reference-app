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

cd flask-docker/deployment

chmod 770 start-app.sh

./start-app.sh

curl http://localhost/
curl http://localhost/jwt
curl http://localhost/all/<jwt_token>
curl http://localhost/tag/aladdin
curl http://localhost/tag/moana
curl http://localhost/tag/classic

```

- [http://localhost/tag/aladdin](http://localhost/tag/aladdin)
- [http://localhost/tag/moana](http://localhost/tag/moana)
- [http://localhost/tag/classic](http://localhost/tag/classic)
- [http://localhost/tag/Fairly%20Odd%20Parents](http://localhost/tag/Fairly%20Odd%20Parents)


