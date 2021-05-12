#! /bin/bash
# Build the docker image with the TurtleBot3 PC ROS2 nodes.

# If first parameter is "NOCACHE", build without the cache
if [[ "$1" == "NOCACHE" ]] ; then
    NOCACHE=--no-cache
fi
    
docker build ${NOCACHE}  -t turtlebotpc . | tee buildTurtlebotPC.out

