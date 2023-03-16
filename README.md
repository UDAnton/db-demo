# DB demo
Application for test diff indexes and configurations for MariaDB

## Build spring boot application .jar with maven
```
mvn clean package
```

## Build docker image
```
docker build -t db-demo-example .
```

## Run docker container for MariaDB and practice with sql queries from database/users.sql file
```
docker run --name mariadb-demo -p 3306:3306 -v /var/lib/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root_pass -d yobasystems/alpine-mariadb 
```

## Run docker container(with SPRING_PROFILES_ACTIVE if you want to insert data in table)
```
docker run --name db-demo-example [-e "SPRING_PROFILES_ACTIVE=db"] -p 8080:8080 db-demo
```

## run ab tool for testing inserts with diff innodb_flush_log_at_trx_commit [0, 1, 2]
```
ab -n 10000 -c 30 -m POST 'http://localhost:8080/api/users'
```
