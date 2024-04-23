FROM prom/alertmanager:v0.27.0

COPY ./alertmanager.yml /etc/alertmanager/config.yml
RUN mkdir -p /etc/alertmanager/template
COPY ./alert-templates /etc/alertmanager/template

COPY ./alertmanager/entrypoint.sh /

USER root
RUN chmod +x /entrypoint.sh
USER nobody

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--config.file=/etc/alertmanager/config.yml", "--storage.path=/alertmanager"]
