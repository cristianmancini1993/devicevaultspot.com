#!/usr/bin/env bash
# Deploy from your Mac when GitHub Actions SSH key is on the server.
set -eu
SSH_HOST="${DEPLOY_SSH_HOST:-devicevaultspot}"
REPO="${DEPLOY_REPO_PATH:-/var/www/devicevaultspot.com}"
ssh "${SSH_HOST}" "cd '${REPO}' && git fetch origin main && git reset --hard origin/main && bash scripts/server-deploy.sh"
echo "Done. Check: https://devicevaultspot.com/it/forvex-4363/"
