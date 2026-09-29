FROM python:3.12

RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    ripgrep \
    procps \
    libpq-dev \
    tmux \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://chatgpt.com/codex/install.sh | sh

# Codex config
RUN mkdir -p /root/.codex
COPY config.toml /root/.codex/config.toml
