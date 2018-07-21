#!/bin/bash
export MESSAGING_HOME=.
echo $1
if [ -z "$1" ];
then
  jmxport=8000
else
  jmxport=800$1
fi
echo "Binding JMX to port $jmxport" 
java -jar -Dcatalina.home=. -Dspring.config.additional-location=file:$MESSAGING_HOME/config$1/application.yml -Dsomeco.activemq.conf=file:$MESSAGING_HOME/config$1 $MESSAGING_HOME/target/message-bus-7.5-SNAPSHOT.war --debug

