from ubuntu:14.04

RUN apt-get -y update

RUN apt-get install -yf \
    openjdk-7-jdk \
    mysql-server \
    scala \
    git

RUN mkdir /etc/hackpad

VOLUME /etc/hackpad/src

RUN git clone https://github.com/whucecil/hackpad.git /etc/hackpad/src

COPY bin/docker-entrypoint.sh /etc/hackpad/

ENTRYPOINT ["/etc/hackpad/docker-entrypoint.sh"]

EXPOSE 9000

CMD ["hackpad"]
