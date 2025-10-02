# Initial VPS Setup (Debian) for VPN

This guide covers the first steps to secure and prepare a fresh Debian VPS before configuring it for VPN usage.

---

## 1. Connect to Your VPS

From your local machine:

```bash
ssh root@your_vps_ip
```

---

## 2. Create a New User

It's best practice to avoid using `root` directly. Create a new user (replace `username` with your preferred login name):

```bash
adduser username
```

Grant the user administrative privileges:

```bash
usermod -aG sudo username
```

---

## 3. Configure SSH Access

### Copy Your SSH Key

On your local machine, generate a key if you don’t already have one:

```bash
ssh-keygen -t ed25519
```

Copy the public key to your VPS:

```bash
ssh-copy-id username@your_vps_ip
```

### Disable Root and Password Login

Edit the SSH configuration:

```bash
sudo vim /etc/ssh/sshd_config
```

Set or update the following lines:

```
PermitRootLogin no
PasswordAuthentication no
```

Restart SSH service:

```bash
sudo systemctl restart ssh
```

Now reconnect as your new user:

```bash
ssh username@your_vps_ip
```

---

## 4. Install Essential Packages

Update packages and install useful tools:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y vim git curl wget ufw
```

---

## 5. Configure Firewall (UFW)

Enable a basic firewall policy:

```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
```

---

## 6. Verify Setup

* Ensure root login is disabled.
* Ensure password login is disabled.
* Verify you can log in only with your SSH key.

---

## Best Practices

* Use **SSH keys** instead of passwords.
* Keep your system updated (`sudo apt update && sudo apt upgrade` regularly).
* Use a non-root user with `sudo`.
* Install only required services.
* Configure and test your firewall rules.
* Consider fail2ban for brute-force protection.

---

✅ At this point, your VPS is secured and ready for VPN configuration.

