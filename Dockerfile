# Image for Turtlebot3 controlling PC
# Built as specified in https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup

FROM ubuntu:20.04

RUN echo UTC >/etc/timezone

# Tell the libraries not to use the interactive dialogs
ARG DEBIAN_FRONTEND=noninteractive
ARG TERM=linux

# Update any standard packaged
RUN apt-get update \
    && apt-get upgrade -y

# Install misc development tools
RUN apt-get install -y \
            curl \
            sudo \
            vim \
            wget

# Install Xfce as a light-weight desktop environment
RUN apt-get install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils

# To get to all that X11 goodness, install vnc
RUN apt-get install -y xvfb x11vnc

# Install latest ROS2
RUN wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros2_foxy.sh \
    && chmod 755 ./install_ros2_foxy.sh \
    && bash ./install_ros2_foxy.sh

# Colcon
RUN apt install -y python3-colcon-common-extensions

# Gazebo11
RUN apt install -y ros-foxy-gazebo-*

# Chartographer
RUN apt install -y ros-foxy-cartographer ros-foxy-cartographer-ros

# Navigation2
RUN apt install -y ros-foxy-navigation2 ros-foxy-nav2-bringup

# vcstool
RUN apt install -y python3-vcstool

# Turtlebot3 packages
RUN . /opt/ros/foxy/setup.sh \
    && apt install -y ros-foxy-dynamixel-sdk ros-foxy-turtlebot3-msgs ros-foxy-turtlebot3

ENV USER=tb

# Add a user for the server to run under
RUN adduser --disabled-password --gecos 'turtlebot user' ${USER}

COPY files/system-startX.sh /home/${USER}
COPY --chown=${USER}:${USER} files/bash_aliases /home/${USER}/.bash_aliases
COPY --chown=${USER}:${USER} files/startX.sh /home/${USER}/startX.sh

WORKDIR /home/${USER}

# Note the USER reference. Variables are not replaced in this string
ENTRYPOINT [ "/home/tb/system-startX.sh" ]
