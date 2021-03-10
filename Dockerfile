FROM mysql:8.0

ENV MYSQL_DATABASE="steam"

ENV MYSQL_USER="developer"
ENV MYSQL_PASSWORD="theItPerson"

ENV MYSQL_ROOT_PASSWORD="gamesForFun"

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306