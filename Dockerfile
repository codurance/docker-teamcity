FROM java:8
EXPOSE 8111

COPY TeamCity-9.0.2.tar.gz TeamCity.tar.gz
RUN tar xf TeamCity.tar.gz

COPY start_server start_server
RUN chmod +x start_server

COPY start_agent start_agent
RUN chmod +x start_agent
