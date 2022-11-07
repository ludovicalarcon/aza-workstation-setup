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
else
  echo "Distro not supported"
fi
