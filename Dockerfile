FROM nginx:1.11.10

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./_book /usr/share/nginx/html/docs

EXPOSE 8001
