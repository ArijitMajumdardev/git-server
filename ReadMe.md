# How to Use

## create a ssh-keys/authorized_keys and copy you public ssh keys into this file

## Build and run the container:
docker-compose up -d --build

## Add your SSH key to /home/git/.ssh/authorized_keys in the container:
docker exec -it git-server bash
echo "your-public-key" >> /home/git/.ssh/authorized_keys

## Connect via SSH:
ssh git@localhost -p 2222

## Create a repository:
git> new my-repo

## Test SSH login again:
ssh -p 2222 git@localhost

## Clone the repository:
git clone ssh://git@localhost:2222/home/git/repos/repo1.git
