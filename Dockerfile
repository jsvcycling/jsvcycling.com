#
# Stage 1: Generate Hugo site.
#
FROM alpine:latest

# 1. Copy over website.
COPY . /site

# 1. Download Hugo and Git.
RUN apk add --no-cache git hugo && git submodule update --init && hugo --minify

#
# Stage 2: Run the site on NGINX.
#
FROM nginx:latest

# ...