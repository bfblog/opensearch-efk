FROM fluentd:latest AS builder

USER root

COPY install.sh ./install.sh

RUN ./install.sh

USER fluent

ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]