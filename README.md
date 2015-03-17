# docker-apt-cacher-ng

apt-cacher-ng docker image

## Run

```
docker create \
  --name apt-cacher-ng \
  --restart always \
  --net host \
  -v $PWD/cache:/var/cache/apt-cacher-ng \
  xinix-technology/apt-cacher-ng
```