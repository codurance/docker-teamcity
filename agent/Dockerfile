# docker run -e TEAMCITY_SERVER=http://buildserver:8111 -dt -p 9090:9090 samirtalwar/teamcity-agent

FROM java:8

EXPOSE 9090

ADD setup-agent.sh setup-agent.sh
RUN chmod +x setup-agent.sh
ENTRYPOINT ./setup-agent.sh run
