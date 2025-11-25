FROM grafana/otel-lgtm:0.11.17

COPY prometheus.yaml /otel-lgtm/prometheus.yaml
COPY dashboards.yaml /otel-lgtm/grafana/conf/provisioning/dashboards/
COPY dashboards /otel-lgtm/grafana/conf/provisioning/dashboards/

RUN chmod -R 777 /otel-lgtm/grafana/conf/provisioning/dashboards