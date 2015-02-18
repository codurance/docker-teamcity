# docker run --name=teamcity -p 8111:8111 samirtalwar/teamcity

FROM java:8
EXPOSE 8111

COPY TeamCity-9.0.2.tar.gz TeamCity.tar.gz
RUN tar xf TeamCity.tar.gz

COPY start start
RUN chmod +x start
ENTRYPOINT ./start
