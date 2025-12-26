#!/bin/bash
set -e

echo "[+] Hardening SSH configuration"

SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.bak.$(date +%F)"

cp $SSHD_CONFIG $BACKUP
echo "[+] Backup created: $BACKUP"

sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' $SSHD_CONFIG
sed -i 's/^#\?PermitRootLogin.*/PermitRootLogin no/' $SSHD_CONFIG
sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' $SSHD_CONFIG
sed -i 's/^#\?ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/' $SSHD_CONFIG
sed -i 's/^#\?UsePAM.*/UsePAM yes/' $SSHD_CONFIG

echo "AllowUsers deploy" >> $SSHD_CONFIG

systemctl restart sshd
echo "[+] SSH hardened successfully"
