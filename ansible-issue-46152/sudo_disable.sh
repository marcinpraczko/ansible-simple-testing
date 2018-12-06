echo "[+] Disabling running docker with sudo..."
unset AT_DOCKER_PREFIX

echo "[+] Enabled variables (should BE EMPTY)..."
env | grep AT_DOCKER_PREFIX
