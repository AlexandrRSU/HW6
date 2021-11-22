FROM maven:3.6.1-jdk-8 as maven_builder

ENV HOME=/app

WORKDIR $HOME

ADD pom.xml $HOME

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . $HOME

RUN ["mvn","clean","install","-T","2C","-DskipTests=true"]


FROM tomcat:8.5.43-jdk8

COPY --from=maven_builder /app/target/hello-1.0.war /usr/local/tomcat/webapps
