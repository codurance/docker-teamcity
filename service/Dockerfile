FROM java:8
EXPOSE 8111

COPY TeamCity-9.0.2.tar.gz TeamCity.tar.gz
RUN tar xf TeamCity.tar.gz

COPY start_server start_server
RUN chmod +x start_server

COPY start_agent start_agent
RUN chmod +x start_agent

RUN (cd /lib/x86_64-linux-gnu && ln -s libdevmapper.so.1.02.1 libdevmapper.so.1.02)
