FROM nginx:alpine

USER root

RUN apk update
RUN apk add nodejs

ADD src /app/src
COPY package.json /app/
COPY package-lock.json /app/
COPY .angular-cli.json /app/
COPY tsconfig.json /app/
COPY tslint.json /app/

WORKDIR /app

RUN npm install

RUN npm run build

#COPY .nginx/nginx.conf /etc/nginx

RUN rm -rf /usr/share/nginx/html/*

RUN cp -r /app/dist/* /usr/share/nginx/html

RUN apk del nodejs
RUN apk cache clean
RUN rm-rf ~/node_modules
