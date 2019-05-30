COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
OUTPUT_PATH="/opt/bin"
sudo mkdir -p /opt/bin
sudo curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o ${OUTPUT_PATH}/docker-compose
sudo chmod +x ${OUTPUT_PATH}/docker-compose
docker-compose -v

test -f /etc/docker/daemon.json && exit
docker ps -a
echo '{ "insecure-registries":["10.2.66.60:5000"] }' > ~/daemon.json
sudo chmod 644 ~/daemon.json
sudo mv ~/daemon.json /etc/docker/daemon.json
sudo systemctl restart docker