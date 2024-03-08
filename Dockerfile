# Stage 1: Build Angular app
FROM node:latest AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --output-path=./dist/out

# Stage 2: Serve Angular app using Nginx
FROM nginx:latest
COPY --from=build /app/dist/out/browser /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
