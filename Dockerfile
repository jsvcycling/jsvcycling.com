#
# Stage 1: Generate Hugo site.
#
FROM alpine:latest AS build

ARG BUILD_DRAFTS=-D
ARG BASE_URL=http://localhost:8080/

# 1. Install Git and Hugo.
RUN apk add --no-cache hugo git

# 2. Copy over website.
COPY . /site
WORKDIR /site

# 3. Get Bulma and Run Hugo.
RUN git submodule update --init && hugo --baseURL ${BASE_URL} ${BUILD_DRAFTS}

#
# Stage 2: Run the site on NGINX.
#
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

RUN echo ${BASE_URL}
RUN rm -fr * .??* && sed -i 's/80/5000/g' /etc/nginx/conf.d/default.conf
COPY --from=build /site/public /usr/share/nginx/html

EXPOSE 5000
STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]