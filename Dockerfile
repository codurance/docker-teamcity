# docker run --name=teamcity-postgres -e POSTGRES_USER=teamcity -P postgres
# docker run --name=teamcity --link teamcity-postgres:postgresql -p 8111:8111 teamcity

FROM java:8
EXPOSE 8111

COPY postgresql-9.4-1200.jdbc41.jar /root/.BuildServer/lib/jdbc/postgresql.jdbc41.jar
COPY TeamCity-9.0.2.tar.gz TeamCity.tar.gz
RUN tar xf TeamCity.tar.gz

COPY start start
RUN chmod +x start
ENTRYPOINT ./start
