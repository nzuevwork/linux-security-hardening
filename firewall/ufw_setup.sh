#!/bin/bash
set -e

echo "[+] Configuring UFW firewall"

apt install -y ufw

ufw default deny incoming
ufw default allow outgoing

ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

ufw --force enable

echo "[+] Firewall configured"
ufw status verbose
