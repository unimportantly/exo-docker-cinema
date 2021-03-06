FROM maven:3.6.3-jdk-11 as BUILD
WORKDIR /app
COPY . .
RUN mvn package

FROM openjdk:11
WORKDIR /app
COPY --from=BUILD app/target/*.jar ./app.jar
EXPOSE 90
CMD ["java", "-jar", "app.jar"]

