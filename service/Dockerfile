FROM java:8

# The TeamCity server runs on this port.
EXPOSE 8111

# This installs fig 1.0.1, which is needed for continuous deployment.
RUN (curl --fail -L "https://github.com/docker/fig/releases/download/1.0.1/fig-$(uname -s)-$(uname -m)" > /usr/local/bin/fig) && chmod +x /usr/local/bin/fig

# TeamCity. Obviously.
RUN curl --fail -L https://download.jetbrains.com/teamcity/TeamCity-9.0.3.tar.gz -o TeamCity.tar.gz
RUN tar xf TeamCity.tar.gz

# This script is used to start the TeamCity server, and should be run as the entry point by a Dockerfile that extends this one.
COPY start_server start_server
RUN chmod +x start_server

# This script is used to start a TeamCity agent, and should be run as the entry point by a Dockerfile that extends this one.
COPY start_agent start_agent
RUN chmod +x start_agent

# This is a hack to make Docker work. The version of Docker provided by Amazon Linux depends on libdevmapper.so.1.02,
# and a later (compatible) version is present. The command symlinks the former to the latter so that it will use it
# without question.
RUN (cd /lib/x86_64-linux-gnu && ln -s libdevmapper.so.1.02.1 libdevmapper.so.1.02)
