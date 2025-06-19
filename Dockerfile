FROM husarion/rviz2:humble

# Add the alias to the .bashrc file
RUN echo "alias my_second_alias='echo Hello, World!'" >> /root/.bashrc
RUN echo "alias rviz='ros2 run rviz2 rviz2'" >> /root/.bashrc