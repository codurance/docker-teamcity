FROM java:8
EXPOSE 8111
COPY TeamCity-9.0.2.tar.gz TeamCity.tar.gz
RUN tar xf TeamCity.tar.gz
WORKDIR TeamCity
ENTRYPOINT bin/teamcity-server.sh run
