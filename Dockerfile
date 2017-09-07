FROM nginx:alpine

USER root

RUN apk update
RUN apk add nodejs

ADD package.json /tmp
ADD package-lock.json /tmp
RUN cd /tmp && npm install
RUN mkdir -p /app && cp -a /tmp/node_modules /app/

WORKDIR /app

COPY . .

RUN npm run build

#COPY .nginx/nginx.conf /etc/nginx

RUN rm -rf /usr/share/nginx/html/*

RUN cp -r /app/dist/* /usr/share/nginx/html
