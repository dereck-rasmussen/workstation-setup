# Workstation Setup

This project automates the process of setting up a new Pivotal machine using a simple [Bash](https://www.gnu.org/software/bash/) script.

## Getting Started
**Warning: the automation script is currently aggressive about what it does and will overwrite vim configurations, bash-it configurations, etc.**

Open up Terminal.app and run the following commands:

```sh
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/dereck-rasmussen/workstation-setup.git
cd workstation-setup
./setup.sh
```

The list of Engineering applications is found in: [applications-common.sh](https://github.com/pivotal/workstation-setup/blob/master/scripts/common/applications-common.sh)

## Frequently Asked Questions

### Is it okay to run `./setup.sh` command again?

Yes. The script does not reinstall apps that are already on the machine.