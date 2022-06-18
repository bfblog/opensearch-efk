FROM fluentd:latest

USER root

RUN gem install fluent-plugin-opensearch fluent-plugin-kubernetes

USER fluent

ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]