# Stage 1: Build Angular app
FROM node:latest AS build
WORKDIR /
COPY . .
RUN npm install
RUN npm run build -- --output-path= dist

# Stage 2: Serve Angular app using Nginx
FROM nginx:latest
COPY --from=build dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
