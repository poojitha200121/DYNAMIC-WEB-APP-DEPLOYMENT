# First stage: Build the Maven project
FROM maven:3.8.5-openjdk-11 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the Maven project files
COPY pom.xml /app
COPY src /app/src

# Run Maven build and package the project
RUN mvn clean package

# Second stage: Create the Tomcat image
FROM tomcat:9.0

# Copy the WAR file from the first stage
COPY --from=build /app/target/my-servlet-project.war /usr/local/tomcat/webapps/

# Change Tomcat to use port 9090 instead of 8080
RUN sed -i 's/port="8080"/port="9090"/g' /usr/local/tomcat/conf/server.xml

# Expose port 9090
EXPOSE 9090

# Start Tomcat
CMD ["catalina.sh", "run"]
