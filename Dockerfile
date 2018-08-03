FROM registry.access.redhat.com/rhel7-atomic

RUN microdnf --enablerepo=rhel-7-server-rpms \
    install python --nodocs ;\
    microdnf clean all

ADD index.html /tmp/index.html

ENV HTTP_PORT 8080
EXPOSE ${HTTP_PORT}

WORKDIR /tmp
CMD "/usr/bin/python -m SimpleHTTPServer ${HTTP_PORT}"
