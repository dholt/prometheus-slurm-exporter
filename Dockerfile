FROM ubuntu:18.04 as build
RUN apt-get update && apt-get -y install golang-github-prometheus-client-golang-dev git build-essential golang munge supervisor

RUN git clone https://github.com/vpenso/prometheus-slurm-exporter.git && \
    cd prometheus-slurm-exporter && make

RUN useradd -M slurm && \
    userdel munge && \
    groupadd -g 116 munge && \
    useradd -M -u 110 -g 116 munge && \
    mkdir -p /var/run/munge && \
    chown -R munge:munge /var/log/munge /var/lib/munge /var/run/munge
ADD supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 8080
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
