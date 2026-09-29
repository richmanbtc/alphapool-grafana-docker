# Custom Grafana image

Builds from `grafana/grafana:13.2.2` with `grafana-bigquery-datasource`
installed at build time. The root Dockerfile is for the development environment;
the image Dockerfile is in `docker/grafana`.

## GitHub Actions setup

Configure these under Settings > Secrets and variables > Actions:

| Type | Name | Purpose |
| --- | --- | --- |
| Variable | `DOCKERHUB_REPOSITORY` | Target Docker Hub repository, including its namespace |
| Secret | `DOCKERHUB_USERNAME` | Docker Hub login username |
| Secret | `DOCKERHUB_TOKEN` | Access token with write permission to the target repository |

Create the target repository in Docker Hub before publishing. Keep actual
deployment values and credentials in GitHub settings, outside this repository.

Changes to the image Dockerfile or workflow on `main` or `master` trigger a
build and push. Manual runs on these branches also publish. Pull requests and
manual runs on other branches only build. The repository variable is required
for all runs; login secrets are only used when publishing.

The workflow publishes `linux/amd64` images with `13.2.2`, `latest`, and
`sha-<commit>` tags. The plugin version is resolved at build time, so uncached
rebuilds may produce different contents. Clear the build cache to refresh it.

Plugins are stored separately from Grafana's persistent data directory, allowing
data volumes without hiding the bundled plugin. Configure the BigQuery data
source and its credentials separately in Grafana.
