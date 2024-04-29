#!/bin/bash

echo "Golang installation script"
echo ""
echo "Download Golang"

if [[ $(echo $USER) == "root" ]]
then
  echo "User: root"
  if wget https://go.dev/dl/go1.22.2.linux-amd64.tar.gz > /dev/null
  then
    echo "Complete download Golang"
    if rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz > /dev/null
    then
      echo "Golang is Installed"
      if echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile > /dev/null
      then
        echo "Adding PATH to /etc/profile"
        read -p "Are you add to .zshrc file" zshp
        if [[ -f /root/.zshrc ]]
        then
          echo "export PATH=$PATH:/usr/local/go/bin" >> /root/.zshrc
        else
          echo ".zshrc file not found"
        fi
      else
        echo "Error: cannot add PATH to /etc/passwd"
      fi
    else
      echo "Cannot Install Golang"
    fi
  else
    echo "Cannot download Golang, please check your internet connection."
  fi
else
  echo "Plase run with root user!"
fi
