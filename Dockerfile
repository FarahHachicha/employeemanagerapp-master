FROM nginx:alpine
COPY ./dist/employeemanagerapp ./usr/share/nginx/html
