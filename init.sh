#! /bin/bash

function installPlaybook() {
  echo "Installing playbook community.general"
  ansible-galaxy collection install community.general
}

function runPlaybook() {
  echo "Runing playbook"
  ansible-playbook workstation_setup.yaml -K
}

function installAzCli() {
  if ! command -v az &> /dev/null
  then
    echo "Installing AZ Cli"
    curl -L https://aka.ms/InstallAzureCli | bash
  fi
}

if command -v pacman &> /dev/null
then
  if ! command -v ansible &> /dev/null
  then
    echo "Installing Ansible"
    sudo pacman -Syu ansible --noconfirm
    installPlaybook
    installAzCli
  fi
  runPlaybook
elif command -v apt &> /dev/null
then
  if ! command -v ansible &> /dev/null
  then
    sudo apt-add-repository ppa:ansible/ansible
    sudo apt update
    sudo apt install ansible -y
    installPlaybook
    installAzCli
  fi
  runPlaybook
elif command -v zypper &> /dev/null
then
  if ! command -v ansible &> /dev/null
  then
    sudo zypper refresh
    sudo -n zypper install -y ansible
    installPlaybook
  fi
  runPlaybook
else
  echo "Distro not supported"
fi
