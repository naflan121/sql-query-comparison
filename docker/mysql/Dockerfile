FROM mysql:8.0

# Custom MySQL configuration
COPY my.cnf /etc/mysql/conf.d/

# Copy initialization scripts
COPY ../../init/schema.sql /docker-entrypoint-initdb.d/01-schema.sql
COPY ../../init/sample_data.sql /docker-entrypoint-initdb.d/02-sample_data.sql

# Set character set
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
