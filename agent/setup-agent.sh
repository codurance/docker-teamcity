#!/bin/bash

set -e

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'

TEAMCITY_SERVER="server:$SERVER_PORT_8111_TCP_PORT"
AGENT_DIR="${HOME}/agent"

if [ ! -d "$AGENT_DIR" ]; then
    cd "$HOME"
    echo "Setting up TeamCity agent for the first time..."
    echo "Agent will be installed to ${AGENT_DIR}."
    mkdir -p "$AGENT_DIR"
    wget "$TEAMCITY_SERVER/update/buildAgent.zip"
    unzip -q -d "$AGENT_DIR" buildAgent.zip
    rm buildAgent.zip
    chmod +x "$AGENT_DIR/bin/agent.sh"
    echo "serverUrl=$TEAMCITY_SERVER" > "$AGENT_DIR/conf/buildAgent.properties"
    echo "name=" >> "$AGENT_DIR/conf/buildAgent.properties"
    echo "workDir=../work" >> "$AGENT_DIR/conf/buildAgent.properties"
    echo "tempDir=../temp" >> "$AGENT_DIR/conf/buildAgent.properties"
    echo "systemDir=../system" >> "$AGENT_DIR/conf/buildAgent.properties"
else
    echo "Using agent at ${AGENT_DIR}."
fi

"$AGENT_DIR/bin/agent.sh" run
