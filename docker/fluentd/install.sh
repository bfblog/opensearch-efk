#!/bin/ash

apk add ruby-dev make gcc g++

gem install fluent-plugin-opensearch -v 1.0.7
gem install fluent-plugin-kubernetes -v 0.3.1
gem install fluent-plugin-kubernetes_metadata_filter -v 2.11.1
gem install fluent-plugin-multi-format-parser -v 1.0.0

apk del ruby-dev make gcc g++
