# Use a base image with Flutter pre-installed
FROM cirrusci/flutter:stable

# Install Java (assuming the JAR file requires Java)
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk

# Copy your Flutter project into the Docker image
COPY . /app
WORKDIR /app

# Add the JAR file to a directory in the Docker image
COPY path/to/your/library.jar /usr/local/lib/library.jar

# Set the CLASSPATH environment variable to include the JAR file
ENV CLASSPATH /usr/local/lib/library.jar

# You can also add commands to build and run your Flutter project
# Example to build the Flutter app
RUN flutter pub get
RUN flutter build apk --release

# Command to run your app (if applicable)
# CMD ["flutter", "run"]

# Expose the necessary port (if applicable)
EXPOSE 8080
