# Use the official Node.js 16 image as the base image
FROM node:16

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Node.js dependencies
RUN npm install
RUN npm install -g @angular/cli@12.2.16

# Copy the application files to the working directory
COPY . .

#Build the Angular project
RUN ng build

# Expose the port your app will run on
EXPOSE 4200

# Command to running your apps using
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
