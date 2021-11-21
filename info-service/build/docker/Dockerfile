FROM adoptopenjdk/openjdk8-openj9:ubi

EXPOSE 8076

COPY build/libs/*.jar info-service.jar

ENTRYPOINT ["java", "-jar", "/info-service.jar"]
