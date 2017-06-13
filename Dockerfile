FROM billryan/gitbook:base
MAINTAINER Rhett <yuanbin2014@gmail.com>

# install gitbook versions
RUN gitbook fetch latest

COPY ./ /exp

EXPOSE 8001

WORKDIR /exp

RUN gitbook build

CMD ["gitbook", "--port", "8001", "serve"]