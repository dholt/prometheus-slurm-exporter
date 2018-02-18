FROM ubuntu:18.04 as build
RUN apt-get update && apt-get -y install golang-github-prometheus-client-golang-dev git build-essential golang munge

RUN git clone https://github.com/vpenso/prometheus-slurm-exporter.git && \
    cd prometheus-slurm-exporter && make

RUN useradd -M slurm
EXPOSE 8080
ENTRYPOINT ["/prometheus-slurm-exporter/bin/prometheus-slurm-exporter"]
