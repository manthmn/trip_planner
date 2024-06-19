# Use Debian as the base image
FROM debian:latest AS build-env

# Install Flutter dependencies and CA certificates
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Clone the Flutter repository
RUN git clone --depth 1 --branch 3.7.3 https://github.com/flutter/flutter.git /usr/local/flutter

# Set Flutter path
ENV PATH="${PATH}:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin"

# Verify Flutter installation
RUN flutter --version

# Run flutter doctor to check for any issues
RUN flutter doctor -v

# Set the working directory
WORKDIR /app

# Copy the entire project directory into the container
COPY . .

# Fetch Flutter dependencies
RUN flutter pub get

# Verify Flutter version again
RUN flutter --version

# Build the Flutter web application
RUN flutter build web --release --web-renderer html --base-href /

# Example: If you need to serve the built web app, you can use a simple server like nginx or any other server
# Here, we copy the build output to a new nginx container
# FROM nginx:alpine
# COPY --from=build-env /app/build/web /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to run the nginx server
# CMD ["nginx", "-g", "daemon off;"]
