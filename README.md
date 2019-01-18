# docker-asuswrt-merlin-build-env
Asus Merlin build environment in Docker

[![DockerHub Badge](http://dockeri.co/image/yozik04/asuswrt-merlin-build-env)](https://hub.docker.com/r/yozik04/asuswrt-merlin-build-env/)

# Steps
## Checkout Asus merlin repo locally:
```
git clone https://github.com/RMerl/asuswrt-merlin.ng.git
```

# Run image:
```
docker run -v asuswrt-merlin.ng:/home/merlin/asuswrt-merlin-root -t -i yozik04/asuswrt-merlin-build-env
```

# Start build in the running image:
```
cd asuswrt-merlin-root/release/src-rt-6.x.4708/
make rt-ac68u
```
