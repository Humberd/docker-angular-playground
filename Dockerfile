FROM nginx

USER root

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y npm

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

#COPY .nginx/nginx.conf /etc/nginx
RUN rm -rf node_modules
RUN rm -rf /usr/share/nginx/html/*

RUN cp -r /app/dist/* /usr/share/nginx/html
