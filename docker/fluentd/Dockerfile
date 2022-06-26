FROM fluentd:latest AS builder

USER root

RUN apk add ruby-dev make gcc g++
RUN gem install fluent-plugin-opensearch -v 1.0.7
RUN gem install fluent-plugin-kubernetes -v 0.3.1
RUN gem install fluent-plugin-kubernetes_metadata_filter -v 2.11.1
RUN gem install fluent-plugin-multi-format-parser -v 1.0.0

FROM fluentd:latest

USER root

COPY --from=builder /usr/lib/ruby/gems /usr/lib/ruby/gems

USER fluent

ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]