# Flask in Docker

Fun local flask api starting point using:
 * Docker
 * Python 3.6
 * Flask
 * MySQL


For demonstration purposes only :

To get a working demo on your desktop, perform the following steps:

```

git clone https://github.com/rob-robinson/flask-docker.git

cd flask-docker/deployment

chmod 770 start-service.sh
chmod 770 stop-service.sh

# start image search service
./start-service.sh

# some of the data that is available...

curl http://localhost/
curl http://localhost/jwt
curl http://localhost/all/<jwt_token>
curl http://localhost/tag/aladdin
curl http://localhost/tag/moana
curl http://localhost/tag/classic

# stop image search service
./stop-service.sh


```

- [http://localhost/tag/aladdin](http://localhost/tag/aladdin)
- [http://localhost/tag/moana](http://localhost/tag/moana)
- [http://localhost/tag/classic](http://localhost/tag/classic)
- [http://localhost/tag/Fairly Odd Parents](http://localhost/tag/Fairly%20Odd%20Parents)


