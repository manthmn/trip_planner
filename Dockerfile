# Use an nginx image to serve the built Flutter web app
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the build output to the nginx html directory
COPY build/web/ .

# Expose port 80 to serve the Flutter web app
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]
