FROM  adoptopenjdk/openjdk11-openj9:alpine-slim AS builder
WORKDIR app
#ARG JAR_FILE=build/libs/*.jar
COPY  build/libs/*.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM  adoptopenjdk/openjdk11-openj9:alpine-slim
WORKDIR app
COPY --from=builder app/dependencies/ ./
COPY --from=builder app/snapshot-dependencies/ ./
#COPY --from=builder app/resources/ ./
COPY --from=builder app/spring-boot-loader/ ./
COPY --from=builder app/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
