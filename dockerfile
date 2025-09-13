# build with JDK 24
FROM eclipse-temurin:24-jdk AS build
WORKDIR /app
COPY gradlew gradle/ settings.gradle.kts build.gradle.kts ./
COPY src ./src
RUN chmod +x gradlew && ./gradlew --no-daemon clean bootJar

# slim runtime with JRE 24
FROM eclipse-temurin:24-jre
WORKDIR /app
COPY --from=build /app/build/libs/*-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
EXPOSE 8080
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar /app/app.jar"]