FROM maven:3.8.5-openjdk-17

ARG user=spring
ARG group=spring

ENV SPRING_HOME=/home/spring

RUN groupadd -g 1000 ${group} \
	&& useradd -d "$SPRING_HOME" -u 1000 -g 1000 -m -s /bin/bash ${user} \
	&& mkdir -p $SPRING_HOME/config \
	&& mkdir -p $SPRING_HOME/logs \
	&& chown -R ${user}:${group} $SPRING_HOME/config $SPRING_HOME/logs

# Railway 不支持使用 VOLUME, 本地需要构建时，取消下一行的注释
# VOLUME ["$SPRING_HOME/config", "$SPRING_HOME/logs"]

USER ${user}
WORKDIR $SPRING_HOME

COPY . .

RUN echo $(ls -1 /)

RUN echo $(ls -1 /home)

RUN echo $(ls -1 $SPRING_HOME)

