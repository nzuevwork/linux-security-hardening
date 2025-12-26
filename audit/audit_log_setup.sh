#!/bin/bash
set -e

echo "[+] Installing auditd"

apt install -y auditd audispd-plugins
systemctl enable auditd
systemctl start auditd

echo "[+] Audit logging enabled"
