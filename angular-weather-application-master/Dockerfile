# Stage 1: Build an Angular Docker Image
FROM node:15

ARG NODE_OPTIONS
ENV NODE_OPTIONS $NODE_OPTIONS

WORKDIR /app

COPY . .

RUN npm install --force


RUN npm run build

