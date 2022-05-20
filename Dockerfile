FROM bitnami/apache

### NOTE: bitnami apache image user is set to 1001

### Change to root user to perform privileged actions
USER 0

### Install packages
RUN install_packages vim

### Set up dpact user
RUN groupadd -g 1002 -o dpact
RUN useradd -m -d /home/dpact -u 1002 -g 1002 -o -s /bin/bash dpact
ENV HOME=/home/dpact
WORKDIR /home/dpact
COPY --chown=1002:1002 authz_umichlib /home/dpact/authz_umichlib

### Change to dpact user to perform developer actions
USER dpact

### Do nothing
CMD ["sleep", "infinity"]

