FROM maven:3.8.5-openjdk-17

ARG user=spring
ARG group=spring

ENV SPRING_HOME=/home/spring


ENTRYPOINT ["bash","-c","java $JAVA_OPTS -jar app-test.jar"]
