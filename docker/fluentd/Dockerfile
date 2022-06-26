FROM fluentd:latest AS builder

USER root

COPY --chmod=555 install.sh ./install.sh

RUN ./install.sh

USER fluent

ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]