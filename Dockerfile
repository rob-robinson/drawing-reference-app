FROM python:3.6-slim

RUN apt-get update && apt-get install -y \
		gcc \
		mysql-client \
		libmysqlclient-dev \
		python3-dev \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY app/ /app
WORKDIR /app
RUN pip install flask mysqlclient

CMD ["python","app.py"]
