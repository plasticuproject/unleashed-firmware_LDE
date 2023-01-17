FROM ubuntu:22.04

# Set username environment variable
ARG DEV_USER

# Switch to root user
USER root

# Run privileged command
RUN \
  apt-get update && \
  apt-get install -y sudo

# Set user and group
RUN useradd -d /home/$DEV_USER -m $DEV_USER
RUN adduser $DEV_USER sudo
RUN echo "$DEV_USER ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to user
USER $DEV_USER

# Run non-privileged command
RUN \
  sudo apt-get install -y git vim wget flex bison gperf python3 python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 unzip python3-pip && \
  export PATH=$PATH:/home/$DEV_USER/.local/bin && \
  python3 -m pip install --upgrade pip && \
  python3 -m pip install virtualenv && \
  mkdir -p ~/dev && \
  cd ~/dev && \
  git clone --recursive https://github.com/DarkFlippers/unleashed-firmware.git && \
  echo "export PATH=$PATH:/home/$DEV_USER/.local/bin" >> /home/$DEV_USER/.bashrc && \
  pip install -r unleashed-firmware/scripts/requirements.txt

