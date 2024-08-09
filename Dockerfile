# Stage 1: Build the Angular application
FROM node:16 AS build

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install
RUN npm install -g @angular/cli@12.2.16

COPY . .
RUN ng build

# Inspect the build output
RUN ls -la /usr/src/app/dist/hadiya_products_admin

# Stage 2: Serve with NGINX
FROM nginx:alpine

# Inspect the existing conf.d directory
RUN ls -la /etc/nginx/conf.d

COPY --from=build /usr/src/app/dist/hadiya_products_admin /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Inspect the conf.d directory after copying the config
RUN ls -la /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

