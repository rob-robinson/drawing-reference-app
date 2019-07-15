FROM python:3.6

# RUN apt-get update && apt-get install -y \
# 		gcc \
# 		mysql-client \
# 		default-libmysqlclient-dev \
# 		python3-dev \
# 		libssl-dev \
# 	--no-install-recommends && rm -rf /var/lib/apt/lists/*

COPY app_src /app
WORKDIR /app
RUN pip install -r requirements.txt

CMD ["python","app.py"]
