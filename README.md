# docker-springboot
Docker springboot repository with inbuilt hook to New Relic.

This is a quick way to run a springboot Jar in a docker container with inbuilt hooks to push metrics to New Relic.

Please keep your jars and application.properties file in a directory on your host. Supply this directory in the volums.

Usage in docker compose:

  worker:
    image: uchhatre/docker-springboot:latest
    ports:
     - "2080:6080"
    depends_on:
     - "mymysql"
    volumes:
     - /home/user/dirwithcode:/mnt
    environment:
     - APP_NAME=your_app_name
     - APP_PROP=/mnt/application.properties
     - APP_JAR=/mnt/springbootapp-0.1.0.jar
     - NR_KEY=YOUR_NEW_RELIC_KEY
