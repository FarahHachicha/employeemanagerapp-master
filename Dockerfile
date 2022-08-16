//FROM node:16.16.0

//ENV CHROME_BIN=/usr/bin/google-chrome
//WORKDIR /usr/src/app

//RUN npm install -g @angular/cli

//COPY package.json /usr/src/app

//COPY package-lock.json /usr/src/app

//RUN npm install

//COPY . . 
//RUN npm run test

//CMD ng serve --host 0.0.0.0

FROM nginx:alpine
COPY ./dist/employeemanagerapp ./usr/share/nginx/html
