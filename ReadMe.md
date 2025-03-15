# Self-Hosted Git Server with SSH

This project sets up a lightweight Git server using SSH in a Docker container. 
---

## **🚀 Features**
- **Git over SSH** for secure repository management
- **Dockerized** for easy deployment

---

## **🛠 Requirements**
- **Docker** installed on your system
- **Docker Compose** installed
- **An SSH key** (generate one if you don't have it)

---

```sh
ssh-keygen -t ed25519 -C "your-email@example.com"
```

## **📦 Setup & Run the Git Server**
1️⃣ Clone the Repository
```sh
git clone https://github.com/Arijitmadumdardev/git-server.git
cd git-server
```

2️⃣ Add Your SSH Public Key
Ensure your SSH public key is in ssh-keys/authorized_keys:
```sh
mkdir -p ssh-keys
cat ~/.ssh/id_rsa.pub >> ssh-keys/authorized_keys
```

3️⃣ Start the Git Server
Run the following command to start the server:
```sh
docker-compose up -d --build
```

🔑 Connecting to the Git Server
Check SSH Connection
```sh
ssh -p 2222 git@localhost
```
If this logs you into the container without a password prompt, SSH authentication is working!


Clone a Repository
```sh
git clone ssh://git@localhost:2222/home/git/repos/repo1.git
```

Push a Repository
```sh
cd repo1
touch README.md
git add README.md
git commit -m "Initial commit"
git push origin main
```