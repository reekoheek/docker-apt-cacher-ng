FROM debian

COPY root/etc/apt/sources.list /etc/apt/sources.list

RUN apt-get update -y
RUN apt-get install apt-cacher-ng -y

EXPOSE 3142

VOLUME /var/cache/apt-cacher-ng

CMD ["apt-cacher-ng", "-c", "/etc/apt-cacher-ng", "ForeGround=1"]
