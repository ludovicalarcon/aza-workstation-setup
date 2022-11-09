#! /bin/bash

if command -v pacman &> /dev/null
then
  if ! command -v ansible &> /dev/null
  then
    echo "Installing Ansible"
    sudo pacman -Syu ansible --noconfirm
    echo "Installing playbook community.general"
    ansible-galaxy collection install community.general
  fi
  echo "Runing playbook"
  ansible-playbook workstation-setup.yaml -K
  if ! command -v az &> /dev/null
  then
    curl -L https://aka.ms/InstallAzureCli | bash
  fi
else
  echo "Distro not supported"
fi
