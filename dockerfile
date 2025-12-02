FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY build/libs/*.jar app.jar

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/app.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
