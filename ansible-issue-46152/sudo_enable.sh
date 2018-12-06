echo "[+] Enabling running docker with sudo..."
export AT_DOCKER_PREFIX=sudo

echo "[+] Enabled variables (should BE NOT EMPTY)..."
env | grep AT_DOCKER_PREFIX
