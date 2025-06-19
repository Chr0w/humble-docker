FROM husarion/rviz2:humble

# Replace the expired ROS 2 GPG key and update the repo entry
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | \
    gpg --dearmor -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    if [ -f /etc/apt/sources.list.d/ros2-latest.list ]; then \
        sed -i 's|^deb .*ros2/ubuntu.*|deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main|' /etc/apt/sources.list.d/ros2-latest.list; \
    fi

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        curl \
        gnupg \
        lsb-release \
        python3-colcon-common-extensions \
        python3-pip \
        build-essential \
        cmake \
        libopencv-dev \
    && rm -rf /var/lib/apt/lists/*
        
# Add the alias to the .bashrc file
RUN echo "alias rviz='ros2 run rviz2 rviz2'" >> /root/.bashrc
