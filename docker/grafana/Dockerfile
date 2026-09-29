FROM grafana/grafana:13.2.2

# Keep bundled plugins outside the directory used for persistent Grafana data.
ENV GF_PATHS_PLUGINS=/var/lib/grafana-plugins

USER root
RUN mkdir -p "${GF_PATHS_PLUGINS}" \
    && chown grafana:root "${GF_PATHS_PLUGINS}"

USER grafana
RUN grafana cli --pluginsDir "${GF_PATHS_PLUGINS}" plugins install grafana-bigquery-datasource 3.4.2

COPY THIRD_PARTY_NOTICES.md /usr/share/grafana/THIRD_PARTY_NOTICES.md
