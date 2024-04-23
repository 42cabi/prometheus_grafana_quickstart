FROM prom/prometheus:v2.51.2

COPY ./prometheus.yml /etc/prometheus/prometheus.yml
RUN mkdir -p /etc/prometheus/rules
COPY ./alert-rules/ /etc/prometheus/rules/

COPY ./prometheus/entrypoint.sh /

USER root
RUN chmod +x /entrypoint.sh
USER nobody

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--config.file=/etc/prometheus/prometheus.yml", "--storage.tsdb.path=/prometheus", "--web.console.libraries=/etc/prometheus/console_libraries", "--web.console.templates=/etc/prometheus/consoles", "--storage.tsdb.retention.time=200h", "--web.enable-lifecycle"]

