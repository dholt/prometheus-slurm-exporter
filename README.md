Prometheus Slurm Exporter Container
===

Docker container of: https://github.com/vpenso/prometheus-slurm-exporter

__Running:__

```sh
docker run -d -v /usr/bin/sdiag:/usr/bin/sdiag -v /usr/bin/sinfo:/usr/bin/sinfo -v /usr/bin/squeue:/usr/bin/squeue -v /etc/slurm:/etc/slurm:ro -v /usr/lib/slurm:/usr/lib/slurm:ro -v /etc/hosts:/etc/hosts:ro -v /var/run/munge:/var/run/munge:ro -p 8080:8080 dholt/prometheus-slurm-exporter
```
