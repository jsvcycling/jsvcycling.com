#
# Stage 1: Generate Hugo site.
#
FROM ubuntu:bionic AS build

ARG BASE_URL=http://localhost:8080/

# 1. Install Git.
RUN apt-get update && apt-get install git -y

# 2. Download Hugo.
ADD https://github.com/gohugoio/hugo/releases/download/v0.58.3/hugo_extended_0.58.3_Linux-64bit.tar.gz /hugo.tar.gz
RUN tar -xzf /hugo.tar.gz && /hugo version

# 3. Copy over website.
COPY . /site
WORKDIR /site

# 4. Run Hugo.
RUN git submodule update --init && /hugo --baseURL ${BASE_URL}

#
# Stage 2: Run the site on NGINX.
#
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN rm -fr * .??*
COPY --from=build /site/public /usr/share/nginx/html