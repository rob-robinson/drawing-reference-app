
# Drawing Reference using Python/Docker/Flask

Fun local drawing reference tool I build with my daughter.

For demonstration purposes only. Images are intentionally blurred to avoid any copyright issues etc... 

## Getting Started

To get a working demo on your desktop, perform the following steps:

```
git clone https://github.com/rob-robinson/drawing-reference-app.git

cd flask-docker/deployment

# start image search service
./start-service.bash

# some of the data that is available...

curl http://localhost/
curl http://localhost/s/aladdin
curl http://localhost/s/moana
curl http://localhost/s/classic

# stop image search service
./stop-service.bash
```

### Prerequisites

* Docker, any modern version should be OK:
  * [https://www.docker.com/](https://www.docker.com/)

### Installing

Use the directions above to get this working locally... this is not for production, so no deployment instructions will be given...

## Built With

* [Docker]() - 
* [Python]() - 
* [Flask]() - 
* [Jinja2]() -
* [MySQL]() -

## Authors

* [Rob Robinson](https://github.com/rob-robinson)

