#!/bin/bash
env
cd
cp "$APP_PROP" application.properties
cp "$APP_JAR" mysbapplication.jar

if [ -n "$PARENT_HOST" ]; then
  echo "" >> /etc/hosts
  echo "$PARENT_HOST parent-host" >> /etc/hosts
fi

cp /opt/newrelic/newrelic.yml /opt/newrelic/newrelic.yml.orig
cat /opt/newrelic/newrelic.yml.orig  | sed "s=My Application=$APP_NAME="  | sed "s|<%= license_key %>|$NR_KEY|" > /opt/newrelic/newrelic.yml

java -Xms512m -Xmx1024m -Djdk.http.auth.tunneling.disabledSchemes="" -javaagent:/opt/newrelic/newrelic.jar -jar mysbapplication.jar
