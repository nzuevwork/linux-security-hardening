#!/bin/bash
set -e

echo "[+] Installing Fail2Ban"

apt update
apt install -y fail2ban

cat > /etc/fail2ban/jail.local <<EOF
[sshd]
enabled = true
port = ssh
maxretry = 5
bantime = 3600
EOF

systemctl enable fail2ban
systemctl restart fail2ban

echo "[+] Fail2Ban active"
