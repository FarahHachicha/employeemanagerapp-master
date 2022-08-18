# Stage 1
FROM node:16.16.0 


RUN mkdir -p /app


WORKDIR /app

RUN npm install -g @angular/cli


COPY package.json /app

COPY package-lock.json /app


RUN npm install


COPY . /app


RUN npm run build --prod

#Stage 2
#FROM nginx:alpine
#COPY ./dist/employeemanagerapp ./usr/share/nginx/html
