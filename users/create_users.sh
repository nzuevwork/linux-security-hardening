#!/bin/bash
set -e

USER_NAME="deploy"

echo "[+] Creating deployment user: $USER_NAME"

adduser --disabled-password --gecos "" $USER_NAME
mkdir -p /home/$USER_NAME/.ssh
chmod 700 /home/$USER_NAME/.ssh

echo "[+] User created. Add SSH key manually."
