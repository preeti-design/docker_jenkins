## using the base image for the new image
FROM nginx:latest

## copying the application code to the new image
COPY index1.html /usr/share/nginx/html/index1.html

## opening ports 
EXPOSE 80
