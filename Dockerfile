FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:11.0
WORKDIR /appCOPY --from=build /app/target/Uber.jar /app/
EXPOSE 9090
CMD [ "java","-jar","Uber.jar" ]