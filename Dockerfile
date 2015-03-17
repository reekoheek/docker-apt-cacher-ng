FROM debian

RUN echo "Acquire::http { Proxy \"http://192.168.1.10:3142\"; };" > /etc/apt/apt.conf.d/02proxy && \
    echo "deb http://kambing.ui.ac.id/debian/ wheezy main" > /etc/apt/sources.list && \
    echo "# deb http://kambing.ui.ac.id/debian/ wheezy-updates" >> /etc/apt/sources.list && \
    echo "deb http://kambing.ui.ac.id/debian-security/ wheezy/updates main" >> /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get install -y apt-cacher-ng -y && \
    ln -sf /dev/stdout /var/log/apt-cacher-ng/apt-cacher.out && \
    ln -sf /dev/stderr /var/log/apt-cacher-ng/apt-cacher.err

EXPOSE 3142

VOLUME /var/cache/apt-cacher-ng

CMD ["apt-cacher-ng", "-c", "/etc/apt-cacher-ng", "ForeGround=1"]
