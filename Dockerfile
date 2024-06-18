# Use an official Flutter container as the base image
FROM cirrusci/flutter AS builder
# Set the working directory inside the container
WORKDIR /trip_planner

# Copy the pubspec files to the container
COPY /trip_planner/pubspec.yaml .
COPY /trip_planner/pubspec.lock .

# Install dependencies
RUN flutter pub get

# Copy the rest of the app files to the container
COPY . .

# Build the Flutter web app
RUN flutter build web --release

# Use a lightweight HTTP server to serve the built app
# FROM nginx:alpine
# COPY --from=builder /uibuilder/build/web /usr/share/nginx/html
EXPOSE 8080

# FROM cirrusci/flutter AS builder
# EXPOSE 8080
# ADD target/trip_planner.jar trip_planner.jar
# ENTRYPOINT [ "flutter", "-jar", "trip_planner.jar"]