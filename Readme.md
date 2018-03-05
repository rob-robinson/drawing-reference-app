
# Drawing Reference using Python/Docker/Flask

Fun local drawing reference tool I build for my daughter.

For demonstration purposes only. Images are intentionally blurred to avoid any copyright issues etc... 

## Getting Started

To get a working demo on your desktop, perform the following steps:

```

git clone https://github.com/rob-robinson/flask-docker.git

cd flask-docker/deployment

# edit start-service.sh to reflect the location that you downloaded this repo to /deployment 
# : REPO_DIRECTORY=~/Desktop/flask-docker/flask-docker/deployment

chmod 770 start-service.sh
chmod 770 stop-service.sh

# start image search service
./start-service.sh

# some of the data that is available...

curl http://localhost/
curl http://localhost/s/aladdin
curl http://localhost/s/moana
curl http://localhost/s/classic

# stop image search service
./stop-service.sh


```

### Prerequisites

* Docker, any modern version should be OK:
  * [https://www.docker.com/](https://www.docker.com/)

```
Give examples
```

### Installing

Use the directions above to get this working locally... this is not for production, so no deployment instructions will be given...

## Running the tests

No tests yet...

### Break down into end to end tests

No tests yet...

### And coding style tests

No tests yet...

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Docker]() - 
* [Python]() - 
* [Flask]() - 
* [Jinja2]() -
* [MySQL]() -

## Contributing



## Versioning



## Authors

* [Rob Robinson](https://github.com/rob-robinson)

## License


## Acknowledgments

