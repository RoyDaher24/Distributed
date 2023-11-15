# Stage 1: Build an Angular Docker Image
FROM node:15

ARG NODE_OPTIONS
ENV NODE_OPTIONS $NODE_OPTIONS

WORKDIR /app

COPY . .

RUN npm install --force


ARG configuration=dev

RUN npm run build:dev -- --outputPath=./dist --configuration $configuration

RUN useradd imageUser
USER imageUser

# Stage 2, use the compiled app, ready for production with Nginx
FROM nginx
COPY --from=build /app/dist/ /usr/share/nginx/html
COPY /nginx-custom.conf /etc/nginx/conf.d/default.conf
