# Use Alpine-based JRE for the smallest possible security footprint
FROM eclipse-temurin:17-jre-alpine

# Create a non-privileged user to run the app (Security Best Practice)
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

WORKDIR /app

# Copy the JAR from your build folder
COPY target/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
