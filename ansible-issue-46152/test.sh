#!/usr/bin/env bash

AT_DOCKER_PREFIX=${AT_DOCKER_PREFIX-}
lcd=$(pwd)

function log() {
    msg="$1"
    echo ""
    echo "[+] ${msg}..."
}

function last_commits() {
    log "Last 5 commits"
    git shortlog -5
}

function checkout_ansible_with_fix() {
    log "[Git]: Checking out latest version of ansible with FIX"
    if [[ ! -d "ansible-1" ]]; then
        log "Initial checkout for git repo with fix"
        git clone https://github.com/jorijinnall/ansible-1.git
        cd ansible-1
        git checkout --track origin/jori_fix_46152
    else
        log "Update branch with fix"
        cd ansible-1
        git checkout jori_fix_46152
        git pull origin
    fi

    last_commits
    cd ${lcd}
}

# --- MAIN CODE ---
checkout_ansible_with_fix

log "Enable local version of Ansible"
source ansible-1/hacking/env-setup
log "Display Ansible version"
ansible --version

log "[TEST]: Run ansible playbook"
ansible-playbook -i /dev/null playbook_grafana_test.yml

