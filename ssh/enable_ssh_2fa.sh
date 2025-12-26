#!/bin/bash
set -e

echo "[+] Installing Google Authenticator PAM module"

apt update
apt install -y libpam-google-authenticator

PAM_SSHD="/etc/pam.d/sshd"

if ! grep -q "pam_google_authenticator.so" $PAM_SSHD; then
    echo "auth required pam_google_authenticator.so" >> $PAM_SSHD
fi

echo "[+] 2FA enabled (per-user setup required)"
echo "Run: google-authenticator for each SSH user"
