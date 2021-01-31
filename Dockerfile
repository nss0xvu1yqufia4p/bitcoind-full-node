FROM ubuntu:18.04
RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
COPY . .
RUN bash "setup.sh"
CMD ["bitcoind", "--txindex"]
