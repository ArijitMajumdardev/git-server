FROM alpine:latest

# Install required packages
RUN apk add --no-cache git openssh lighttpd

# Create a git user
RUN adduser -D -s /bin/sh git && passwd -u git


# Set up SSH for the git user
RUN mkdir -p /home/git/.ssh && chown -R git:git /home/git/.ssh && chmod 700 /home/git/.ssh

# Copy SSH keys
COPY ssh-keys/authorized_keys /home/git/.ssh/authorized_keys
RUN chmod 600 /home/git/.ssh/authorized_keys && chown -R git:git /home/git/.ssh/authorized_keys

# Create a directory for repositories
RUN mkdir -p /home/git/repos && chown -R git:git /home/git/repos

# Configure Lighttpd for GitWeb
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose SSH and Web UI ports
EXPOSE 22 8080

# Run the entrypoint script on container start
CMD ["/entrypoint.sh"]
