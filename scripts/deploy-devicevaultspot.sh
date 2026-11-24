#!/usr/bin/env bash
# Manual deploy from a machine with SSH key (same as GitHub Actions).
set -euo pipefail
HOST="${DEPLOY_SSH_HOST:-179.198.216.71}"
USER="${DEPLOY_SSH_USER:-root}"
REPO="${DEPLOY_REPO_PATH:-/var/www/devicevaultspot.com}"
SSH_TARGET="${USER}@${HOST}"

ssh -o BatchMode=yes "${SSH_TARGET}" \
  "cd '${REPO}' && git fetch origin main && git reset --hard origin/main && bash scripts/server-deploy.sh"

echo "Done. Check: https://devicevaultspot.com/it/velice/landing.html"