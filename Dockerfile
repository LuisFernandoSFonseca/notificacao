FROM gradle:9.4.1-jdk17-alpine as build
WORKDIR /app
COPY . .
run gradle build --no-daemon

FROM eclipse-temurin:17-alpine-3.20

WORKDIR /app

COPY --from=build /app/build/libs/*.jar /app/notificacao.jar

EXPOSE 8082

CMD ["java", "-jar", "/app/notificacao.jar"]

#Docker file padrão pra GRADLE, o que está sendo utilizado acima, é o arquivo para fazer um docker compose de todo o projeto
#FROM ubuntu:latest
#LABEL authors="luisf"
#
#ENTRYPOINT ["top", "-b"]
#
#FROM eclipse-temurin:17-alpine-3.20
#
#WORKDIR /app
#
#COPY build/libs/notificacao-0.0.1-SNAPSHOT.jar /app/notificacao.jar
#
#EXPOSE 8082
#
#CMD ["java", "-jar", "/app/notificacao.jar"]