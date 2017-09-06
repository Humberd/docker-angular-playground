FROM nginx:alpine

USER root

RUN apt-get install nodejs
RUN apt-get install npm

ADD src /app/src
COPY package.json /app/
COPY package-lock.json /app/
COPY .angular-cli.json /app/
COPY tsconfig.json /app/
COPY tslint.json /app/

WORKDIR /app

RUN npm install

RUN npm run build

COPY .nginx/nginx.conf /etc/nginx

RUN cp -r /app/dist/ /usr/share/nginx/html

CMD ["systemctl", "start", "nginx"]

