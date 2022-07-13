#!/usr/bin/sh

if ! command -v docker > /dev/null
then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

  apt-cache policy docker-ce

  sudo apt-get install -y docker-ce

  sudo service docker start
  sudo service docker status
else
  echo 'docker already installed'
fi


if ! command -v docker-compose > /dev/null
then
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  mv /usr/local/bin/docker-compose /bin/docker-compose
else
  echo 'docker-compose already installed'
fi
