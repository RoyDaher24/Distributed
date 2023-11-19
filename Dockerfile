# Stage 1: Build an Angular Docker Image
FROM node:15

ARG NODE_OPTIONS
ENV NODE_OPTIONS $NODE_OPTIONS

WORKDIR /app

COPY . .

RUN npm install --force

COPY . /app

RUN npm run build

# Stage 2, use the compiled app, ready for production with Nginx
#FROM nginx
#COPY --from=build /app/* /usr/share/nginx/html
#COPY /nginx-custom.conf /etc/nginx/conf.d/default.conf
