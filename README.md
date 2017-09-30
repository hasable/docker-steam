# Steam

The purpoise of this image is to provide a prefetch environment to install Steam application. It's not designed to be run by itself : you should inherit from it.

## How to build this image?

```bash
docker build -t <image name> . 
```

## How to use this image? 

As said, you should inherit from this image. You will then be able to use steamcmd (/opt/steam/steamcmd).

