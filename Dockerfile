# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm update yargs yargs-parser selenium-webdriver  # Add this line to manually update specific packages
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html

