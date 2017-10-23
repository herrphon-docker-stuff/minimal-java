FROM maven:3.3.3-jdk-8 AS builder

WORKDIR /app

# Get all the downloads out of the way
ADD pom.xml  /app/
RUN mvn verify clean --fail-never

ADD src /app/src
RUN mvn package


FROM jetty:9.3.0-jre8 

RUN mkdir -p /home/jetty \
 && chown jetty:jetty /home/jetty 

COPY --from=builder /app/target/*.war $JETTY_BASE/webapps/


