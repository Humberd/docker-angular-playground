FROM nginx:alpine
FROM node:8.3.0-alpine

COPY .nginx/nginx.conf /etc/nginx

COPY * /app

WORKDIR /app

RUN npm install

RUN npm run build

RUN rm -rf /var/www/html/*

COPY dist/* /var/www/html/

RUN sudo -i

CMD ["systemctl", "start", "nginx"]

