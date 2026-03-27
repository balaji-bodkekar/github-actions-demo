FROM eclipse-temurin:17-jre-alpine

RUN apk update && apk upgrade --no-cache

RUN addgroup -S spring && adduser -S spring -G spring

USER spring:spring

WORKDIR /app

COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
