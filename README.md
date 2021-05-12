# TurtleBot3-PC

Docker image of [TurtleBot3] PC controller as described in https://emanual.robotis.com/docs/en/platform/turtlebot3/quick-start/#pc-setup

The docker image has [ROS2 Foxy],
the ROS2 graphical tools (Gazebo, Chartographer, Navigation2),
and the [Turtlebot3] tools (Dynamidel, Turtlebot3, ...).
Additionally, [Xfce4] is installed for a simple X11 window manager.

I created this image because:

1. I didn't want to pollute my development system with all the software packages required for a TurtleBot3 controlling PC, and
2. I run my Linux systems headless and I didn't want to install all the X11 code for the graphical UI robot tools (Rvis, ...)

The operation of this image is kinda kludgey because I have a love/hate
relationship with X11 and all its packages and permissions.
The operation of this image is not very smooth.
The process is:

1. SSH to the headless Linux system that will be running the Docker container
2. Clone this repository
3. cd into `TurtleBot3-PC` (the cloned repository)
4. Start this image by running `run-turtlePC.sh`. This starts the image privilaged and using the host networking
5. Log into the run image with `docker exec -it -u 1000 turtlebotpc /bin/bash
6. Start the X11 window manager by running /home/tb/startX.sh
7. You can then exit the login session
8. I've been using UltraVNC to display the X11 session on my Windows 10 desktop. The VNC login password is what's in `files/system-startX.sh`

The environment variable `ROS_DOMAIN` sets the ROS2 domain id. This defaults to 30 and is set by the user `tb`'s
`.bash_aliases` which is initialized in the Docker image from `files/bash_aliases` [1].

[1]: I put my per-user login script changes in `.bash_aliases` since it is sourced near the end if `.bashrc` and thus my changes are easy to copy and don't mess up the default `.bashrc`.
[UltraVNC]: https://www.uvnc.com/
[Turtlebot3]: https://emanual.robotis.com/docs/en/platform/turtlebot3/overview/
[Xfce4]: https://www.xfce.org/
[ROS2 Foxy]: https://docs.ros.org/en/foxy/Releases/Release-Foxy-Fitzroy.html






