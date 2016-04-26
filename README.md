hf-baseimage
===============

Based on the very well designed [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).

Each time building this image, an [Ubuntu distribution upgrade](https://github.com/phusion/baseimage-docker#upgrading-the-operating-system-inside-the-container) is performed to apply the latest security patches.

#### To use the image:

**Directly:**

    docker pull quay.io/hellofresh/hf-baseimage
      
**As a base image as part of the `Dockerfile`:**

    FROM quay.io/hellofresh/hf-baseimage

##### Important Uage Note:
Do not forget to add the following two instructions to _your_ `Dockerfile` which uses _this_ image as base:

    # Your instructions ...

    # Cleanup APT.
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
    # Use baseimage-docker's init system.
    # Reference: https://github.com/phusion/baseimage-docker#using-baseimage-docker-as-base-image
    # ***  NOTE  ***
    # This requires an *executable* 'run' script which has to be copied to '/etc/service/<YOUR-SERVICE>/run'
    # At container startup time this 'run' script will be picked up by the runit supervise service which is
    # already part of phusion/baseimage-docker.
    CMD ["/sbin/my_init"]

#### More specialised images which make use of _hf-baseimage_

  - [hf-javaimage](https://github.com/hellofresh/hf-javaimage)
  - [hf-golangimage](https://github.com/hellofresh/hf-golangimage)


#### TODO

- [x] Add `ONBUILD` trigger instructions for more specialised HF images
- [ ] Add base tests.
- [ ] ...
