# Initial VPS Setup (Debian) for VPN

## Connect to the VPS

From your local machine:

```bash
ssh root@your_vps_ip
```

## Install Essential Packages

Update packages and install useful tools:

```bash
apt update && apt upgrade -y
```

```bash
apt install -y sudo vim git curl wget ufw
```

## Create a New User

It's best practice to avoid using `root` directly. Create a new user (replace `username` with your preferred login name):

```bash
adduser username
```

Grant the user administrative privileges:

```bash
usermod -aG sudo username
```

## Configure SSH Access

### Copy Your SSH Key

On your local machine, generate a key:

```bash
cd .ssh
ssh-keygen -t ed25519 -C "your_email@example.com"
```
Enter file in which to save the key (/home/user/.ssh/id_ed25519).
Enter passphrase for "id_ed25519" (empty for no passphrase).

Copy the public key to your VPS.

Linux:

```bash
ssh-copy-id username@your_vps_ip
```

Windows:

```bash
type id_ed25519.pub | ssh username@your_vps_ip "mkdir ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

### Use Short Hostnames for Easier Connections

Instead of typing `ssh username@your_vps_ip`, you can define a short alias.

Edit or create the SSH config file on your local machine:

```bash
vim ~/.ssh/config
```

Add an entry:

```
Host myvps
    HostName your_vps_ip
    User username
    IdentityFile ~/.ssh/vps_ed25519
```

Now connect simply with:

```bash
ssh myvps
```

You can add as many servers as you like with different aliases.

Alternative (local only, not recommended for multiple servers):
You can add entries in `/etc/hosts` to map IP → name, e.g.

```
192.168.1.0 myvps
```

Then `ssh username@myvps` will also work.

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
