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
#RUN npm run build --prod
RUN ng build

# Expose the port your app will run on
EXPOSE 4200

# Command to run your application
#CMD ["npm", "run","pm2start"]

# Command to running your apps using
#CMD ["npm", "run","pm2logs"]
#RUN npm run pm2logs
# Run both npm run pm2logs and npm run start using bash
#CMD ["bash", "-c", "ng build --prod & ng serve"]
#command for ng serve
#CMD ["ng", "serve"]
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
