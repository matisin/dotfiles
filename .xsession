#!/bin/bash

ssh-agent {
  ssh-add -t 1h ~/.ssh/matisin ~/.ssh/matias.medina &
  gnome-session
}
