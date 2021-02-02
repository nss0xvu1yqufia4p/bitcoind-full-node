FROM ubuntu:20.04
RUN  apt-get update \
  && apt-get install -y wget nginx \
  && rm -rf /var/lib/apt/lists/*
COPY . .
RUN bash "setup.sh"
CMD ["./start.sh"]
