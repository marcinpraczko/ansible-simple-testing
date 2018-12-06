#!/usr/bin/env bash

VERSIONS="VERSIONS.txt"
lcd=$(pwd)

function log() {
    msg="$1"
    echo ""
    echo "[+] ${msg}..."
}

# --- MAIN CODE ---
log "docker-compose" >"${VERSIONS}"
docker-compose version >>"${VERSIONS}"

log "docker" >>"${VERSIONS}"
docker version >>"${VERSIONS}"
