#!/bin/bash

# Make sure we've built the latest version of the site.
hugo

# Copy the files to the server.
rsync -rP public/ jsvcycling@nash.jsvcycling.dev:/var/www/jsvcycling.com
