# stage 1
FROM node:10 as node
WORKDIR /app
COPY package.json .
RUN npm install
RUN npm update --package-lock-only    # Add this line to update the package-lock.json file
COPY . .
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-app /usr/share/nginx/html


