FROM debian

RUN apt-get update

RUN git clone https://github.com/freenit-framework/freenit

RUN bash -c ./freenit/bin/download_repos.sh
