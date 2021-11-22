# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM osrf/ros:foxy-desktop

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654

RUN apt-get update && \
    apt-get install -y apt-utils debconf-utils gnupg2 lsb-release && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116 && \
    echo "deb http://packages.ros.org/ros2/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros2-latest.list && \
    rosdep update && \
    apt-get update 
RUN RTI_NC_LICENSE_ACCEPTED=yes apt-get install rti-connext-dds-5.3.1

RUN apt-get update && \
    apt-get install -y \
       python3-tk \
       python3-pip && \
       rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip && \
    pip3 install \
        rospkg \
        pydantic \
        fastapi \
        uvicorn \
        cmake \
        netifaces \
        opencv-python \ 
        opencv-contrib-python 

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt install -y ros-foxy-ros-core
RUN apt install -y qtbase5-dev libqt5svg5-dev libzmq3-dev libdw-dev

RUN apt-get update && \
    apt-get install -y \
        tmux \
        ranger \
        wget \
        neovim \
        nano \
        htop \
        iputils-ping && \
        rm -rf /var/lib/apt/lists/*

ENV ROSUSER="user"

RUN adduser --home /home/${ROSUSER} --shell /bin/zsh --gecos '' --disabled-password ${ROSUSER} && \
    usermod -a -G root,sudo,video,tty,dialout ${ROSUSER} && \
    echo "${ROSUSER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${ROSUSER}
user $ROSUSER

EXPOSE 8000