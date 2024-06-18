# Use an official Flutter image as a parent image
FROM cirrusci/flutter:stable

# Set the working directory
WORKDIR /app

# Copy the entire project directory into the container
COPY . .

# Install dependencies
RUN flutter pub get

# Build the Flutter application for release
RUN flutter build apk --release

# Example: If you need to expose a port (for serving a web application, for example)
EXPOSE 8035

# Command to run the Flutter application
# CMD ["flutter", "run"]

# Or if you're building for mobile platforms (Android/iOS), you'd typically use flutter build commands as shown above.
