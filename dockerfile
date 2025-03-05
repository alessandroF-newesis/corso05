from ubuntu:20.04
RUN apt-get update
RUN apt-get -y install cowsay
ENTRYPOINT ["/usr/games/cowsay", "hello"]
