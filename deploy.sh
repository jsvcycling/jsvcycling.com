#!/bin/bash

# Make sure we've built the latest version of the site.
hugo

# Copy the files to the server.
rsync -rP --delete-after public/ nash:/var/www/jsvcycling.com
