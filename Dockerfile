FROM openjdk:14-jdk-oraclelinux8
MAINTAINER uchhatre@gmail.com
EXPOSE 6080
RUN curl -SL https://download.newrelic.com/newrelic/java-agent/newrelic-agent/6.1.0/newrelic-agent-6.1.0.jar -o /tmp/newrelic-agent-6.1.0.jar && \
    curl -SL https://download.newrelic.com/newrelic/java-agent/newrelic-agent/6.1.0/newrelic.yml -o /tmp/newrelic.yml 
COPY run.sh /
RUN chmod +x /run.sh
CMD ["/run.sh"]
