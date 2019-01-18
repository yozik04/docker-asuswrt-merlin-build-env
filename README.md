# docker-asuswrt-merlin-build-env
Asus Merlin build environment in Docker

# Preapare image:
```
docker build -t "asuswrt-merlin-build-env" .
```

# Checkout Asus merlin repo locally:
```
git clone https://github.com/RMerl/asuswrt-merlin.ng.git
```

# Run image:
```
docker run -v asuswrt-merlin.ng:/home/merlin/asuswrt-merlin-root -t -i asuswrt-merlin-build-env
```

# Start build in the running image:
```
cd asuswrt-merlin-root/release/src-rt-6.x.4708/
make rt-ac68u
```
