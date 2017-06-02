FROM nginx:1.11.10

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./ /usr/share/nginx/html

EXPOSE 8001
