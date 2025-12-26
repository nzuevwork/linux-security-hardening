# SSH Hardening

Scripts in this directory:
- harden_ssh.sh – disables password login, root login, enforces key auth
- enable_ssh_2fa.sh – enables TOTP-based 2FA using PAM

## Notes
- Always test SSH changes in an active session
- 2FA applies only to interactive SSH logins
