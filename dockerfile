# Stage 1: Build con Gradle más reciente
FROM gradle:8.6-jdk21 AS builder
WORKDIR /app

COPY build.gradle .
COPY settings.gradle .
COPY src ./src

RUN gradle clean build -x test --no-daemon

# Stage 2: Runtime - puedes mantener Java 17 o usar 21
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/api-gateway-*.jar api-gateway.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "api-gateway.jar"]