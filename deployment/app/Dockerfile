FROM python:3.6-slim

RUN apt-get update && apt-get install -y \
		gcc \
		mysql-client \
		libmysqlclient-dev \
		python3-dev \
		libssl-dev \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

# COPY ./src/ /app
WORKDIR /app
RUN pip install flask mysqlclient Jinja2

CMD ["python","app.py"]
