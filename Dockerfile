FROM nginx:alpine

COPY .nginx/nginx.conf /etc/nginx

RUN npm install

RUN npm run build

RUN rm -rf /var/www/html/*

COPY dist/* /var/www/html/

RUN sudo -i

CMD ["systemctl", "start", "nginx"]

