#!/bin/bash
image_name=rosbot_fastapi:latest
container_name=rosbot2_fastapi

docker run -it --rm --privileged --net=host \
    -v /dev/bus/usb:/dev/bus/usb \
    --device-cgroup-rule='c 189:* rmw' \
    --name $container_name \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $(pwd)/..:/home/user/ros2_ws/src:rw \
    -v /home/${USER}/data:/home/user/data:ro \
    -e DISPLAY=$DISPLAY \
    -e ROS_DOMAIN_ID=0 \
    -e QT_X11_NO_MITSHM=1 \
     fa2aedd3ff9b /bin/bash -c "pip install uvicorn && pip install fastapi && cd /home/user/ros2_ws/src/app && uvicorn main:app --reload"
    