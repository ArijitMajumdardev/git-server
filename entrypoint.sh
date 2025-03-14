#!/bin/sh

# Ensure SSH host keys exist
if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    echo "Generating SSH host keys..."
    ssh-keygen -A
fi

# Ensure SSH is set up properly
mkdir -p /home/git/.ssh
touch /home/git/.ssh/authorized_keys
chmod 700 /home/git/.ssh
chmod 600 /home/git/.ssh/authorized_keys
chown -R git:git /home/git/.ssh

# Ensure repositories directory exists
mkdir -p /home/git/repos
chown -R git:git /home/git/repos

# Auto-create repositories
for repo in repo1 repo2 repo3; do
    if [ ! -d "/home/git/repos/$repo.git" ]; then
        echo "Creating repository: $repo"
        mkdir -p "/home/git/repos/$repo.git"
        git init --bare "/home/git/repos/$repo.git"
        chown -R git:git "/home/git/repos/$repo.git"
    fi
done

# Start SSH server in the foreground
exec /usr/sbin/sshd -D
