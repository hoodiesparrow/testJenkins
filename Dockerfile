FROM node:16 as build-stage
WORKDIR /app
COPY ./test-jenkins/package*.json ./
RUN npm install
COPY ./test-jenkins .
RUN npm run build

FROM nginx:stable-alpine as production-stage
COPY  ./test-jenkins/nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build-stage /app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]