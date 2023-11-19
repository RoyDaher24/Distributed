FROM node:18.10 as build-stage
WORKDIR /app
COPY . .
RUN npm install
COPY . .
RUN npm run build -- --output-path=./dist/out
# Stage 1, based on Nginx, to have only the compiled app, ready for production with Nginx
FROM nginx:1.15
COPY --from=build-stage /app/dist/out/ /usr/share/nginx/html
# Copy the default nginx.conf provided by tiangolo/node-frontend
COPY nginx.conf /etc/nginx/conf.d/default.conf
