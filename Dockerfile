FROM ubuntu:18.04
RUN apt-get update && \
    apt-get -y install golang-github-prometheus-client-golang-dev git build-essential golang munge && \
    git clone https://github.com/vpenso/prometheus-slurm-exporter.git && \
    cd prometheus-slurm-exporter && \
    make && \
    mv bin/prometheus-slurm-exporter /usr/bin && \
    cd / && \
    rm -rf /prometheus-slurm-exporter && \
    useradd -M slurm && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8080
ENTRYPOINT ["/usr/bin/prometheus-slurm-exporter"]
