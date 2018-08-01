FROM registry.access.redhat.com/rhel7-atomic

RUN microdnf --enablerepo=rhel-7-server-rpms \
    install python --nodocs ;\
    microdnf clean all

ADD index.html /tmp/index.html

EXPOSE 8080

WORKDIR /tmp
CMD ["/usr/bin/python", "-m", "SimpleHTTPServer", "8080"]
