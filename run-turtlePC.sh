#! /bin/bash
# Start the Turtlebot3 PC docker image
# Once started, connect graphicly with Remote Desktop Connection (RDP)
#    or exec into it with bash.
# The ROS_DOMAIN_ID is set to 30 or the environment variable unless there is
#    a parameter on the invocation of this script:
#         ./run-turtlebotpc.sh 31

# Set the ROS_DOMAIN_ID to first parameter or the environment
if [[ ! -z "$1" ]] ; then
    ROS_DOMAIN_ID=$1
else
    ROS_DOMAIN_ID=${ROS_DOMAIN_ID:-30}
fi
echo 

docker run -t -d \
    --rm \
    --name=turtlebotpc \
    -e ROS_DOMAIN=${ROS_DOMAIN_ID} \
    --network=host \
    --privileged \
    turtlebotpc:latest

# ghcr.io/misterblue/turtlebotpc
#    --restart=unless-stopped
    
