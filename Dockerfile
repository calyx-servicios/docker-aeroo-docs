FROM ubuntu:18.04

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y git python3-uno libreoffice-writer libreoffice-calc python3-pip xvfb supervisor openjdk-11-jre

RUN pip3 install jsonrpc2 daemonize

RUN git clone https://github.com/aeroo/aeroo_docs.git /opt/aeroo_docs

EXPOSE 8989

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD supervisord -c /etc/supervisor/conf.d/supervisord.conf
