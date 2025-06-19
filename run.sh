#!/bin/bash

# Allow root access to the X server
xhost local:root

# Start Docker Compose
docker compose run rviz

# Revoke root access to the X server after stopping the container
xhost -local:root