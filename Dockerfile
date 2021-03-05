FROM ubuntu:bionic
RUN export TERM=linux

RUN apt-get update
RUN UBUNTU_FRONTEND=noninteractive apt install -y git net-tools tmux python3.7 python3-virtualenv python3-pip apt-utils curl debconf-utils
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install -y nodejs
RUN npm install -g npm


RUN git clone https://github.com/freenit-framework/freenit

RUN bash -c "./freenit/bin/download_repos.sh"

RUN bash -c "./freenit/services/frontend/bin/init.sh" &
RUN bash -c "./freenit/services/frontend/bin/devel.sh" &


RUN bash -c "./freenit/services/backend/bin/init.sh"  &
RUN bash -c "./freenit/services/backend/bin/devel.sh" &
