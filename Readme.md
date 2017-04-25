# Flask in Docker

Fun local flask api starting point using:
 * Docker
 * Python 3.6
 * Flask
 * MySQL


Not production ready !

This is a foundation for having a python rest api available on your local machine


```

git clone https://github.com/rob-robinson/flask-docker.git

cd flask-docker

docker build -t flask-try . 
docker run -d -p 5000:5000 flask-try

curl http://localhost:5000/
curl http://localhost:5000/all
curl http://localhost:5000/hi
curl http://localhost:5000/user/myusername

```