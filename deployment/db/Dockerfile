FROM mysql:5.6

ENV MYSQL_ROOT_PASSWORD 123456
ENV MYSQL_DATABASE image_storage

# create base user and password
ADD data/add_user.sql /docker-entrypoint-initdb.d/add_user.sql

# comment out following line if only using seed:
ADD data/setup.sql /docker-entrypoint-initdb.d/setup.sql
