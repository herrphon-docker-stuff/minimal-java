FROM jetty:9.3.0-jre8 

RUN mkdir -p /home/jetty \
 && chown jetty:jetty /home/jetty 

COPY ./target/*.war $JETTY_BASE/webapps/

