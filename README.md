hf-baseimage
===============

Based on the very well designed [phusion/baseimage-docker](https://github.com/phusion/baseimage-docker).

Each time building this image, an [Ubuntu distribution upgrade](https://github.com/phusion/baseimage-docker#upgrading-the-operating-system-inside-the-container) is performed to apply the latest security patches.

#### To use the image:

**Directly:**

    docker pull quay.io/hellofresh/hf-baseimage
      
**As a base image as part of the `Dockerfile`:**

    FROM quay.io/hellofresh/hf-baseimage

Do not forget to add the following APT cleanup directive to _your_ `Dockerfile` which uses _this_ image as base:

    # Cleanup APT.
    RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#### TODO

- [x] Add `ONBUILD` trigger instructions for more specialised HF images
- [ ] Add base tests.
- [ ] ...
