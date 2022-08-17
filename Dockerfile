#FROM node:16.16.0

#ENV CHROME_BIN=/usr/bin/google-chrome
#WORKDIR /usr/src/app

#RUN npm install -g @angular/cli

#COPY package.json /usr/src/app

#COPY package-lock.json /usr/src/app

#RUN npm install

#COPY . . 
#RUN npm run test

#CMD ng serve --host 0.0.0.0


# Stage 1
FROM node:16.16.0 


RUN mkdir -p /app


WORKDIR /app


COPY package.json /app


RUN npm install


COPY . /app


RUN npm run build --prod

#Stage 2
#FROM nginx:alpine
#COPY ./dist/employeemanagerapp ./usr/share/nginx/html
