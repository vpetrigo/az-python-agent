FROM fedora:32

RUN dnf install --assumeyes \
        ca-certificates curl jq git iputils libcurl libcurl-devel libicu-devel libunwind-devel \
        nmap python3 python3-pip python3-virtualenv python3-setuptools openssh compat-openssl10 && \
    dnf clean all && \
    rm -rf /var/cache/dnf

WORKDIR /azp

COPY ./start.sh .
CMD ["./start.sh"]
