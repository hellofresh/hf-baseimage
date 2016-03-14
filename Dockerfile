# hf-baseimage for Docker containers. Based on phusion/baseimage-docker, quoting:

# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


#
# **  hf-baseimage specific instructions  **
#

# Set APT noninteractive directives.
ENV DEBIAN_FRONTEND=noninteractive

# Install additional packages; execute dist upgrade.
RUN apt-get update && \
    apt-get install -y python && \
    apt-get upgrade -y -o Dpkg::Options::="--force-confold"


# Cleanup APT.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Register trigger to apply security patches.
# No APT cleaning at this point, because images based on this one will probably use APT, too. 
ONBUILD RUN apt-get update && \
            apt-get upgrade -y -o Dpkg::Options::="--force-confold"
