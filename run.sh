#!/bin/bash
env
cd
cp "$APP_PROP" application.properties
cp "$APP_JAR" mysbapplication.jar

if [ -n "$PARENT_HOST" ]; then
  echo "" >> /etc/hosts
  echo "$PARENT_HOST parent-host" >> /etc/hosts
fi

mkdir -p /opt/newrelic
cp /tmp/newrelic-agent-6.1.0.jar /opt/newrelic/newrelic.jar

cp /tmp/newrelic.yml /tmp/newrelic.yml.orig
cat /tmp/newrelic.yml.orig  | sed "s=My Application=$APP_NAME="  | sed "s|<%= license_key %>|$NR_KEY|" > /opt/newrelic/newrelic.yml

java -Xms512m -Xmx1024m -Djdk.http.auth.tunneling.disabledSchemes="" -javaagent:/opt/newrelic/newrelic.jar -jar mysbapplication.jar
