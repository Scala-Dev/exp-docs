FROM node:6.10

RUN npm install -g gitbook-cli

COPY ./ /exp

EXPOSE 8001

WORKDIR /exp

RUN gitbook build

CMD ["gitbook", "--port", "8001", "serve"]