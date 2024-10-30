##Build
#FROM maven:3.8.5-openjdk-17-slim AS build
#WORKDIR /app
#COPY . /app
#RUN mvn clean package -f /app/pom.xml -Dmaven.test.failure.ignore=true

# multl-staging
FROM openjdk:21
WORKDIR /app
COPY target/clinic-appointment-0.0.1-SNAPSHOT.jar app.jar
#COPY --from=build /app/target/clinic-appointment-0.0.1-SNAPSHOT.jar app.jar

# Thiếu folder upload ảnh

EXPOSE 8089
CMD ["java", "-jar", "app.jar"]