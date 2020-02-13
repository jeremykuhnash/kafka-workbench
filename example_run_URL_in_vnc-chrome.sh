#!/bin/bash

echo "Find more examples on - https://github.com/ConSol/docker-headless-vnc-container"

docker run --shm-size=256m -it -p 5901:5901 -p 6901:6901 -e VNC_RESOLUTION=1600x1200 a76fb809452a chromium-browser --no-sandbox http://confluent.io/
