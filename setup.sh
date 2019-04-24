#!/usr/bin/env bash
#
# setup.sh:  run the Pivotal workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/common/homebrew.sh
source ${MY_DIR}/scripts/common/configuration-bash.sh

# Place any applications that require the user to type in their password here

# source ${MY_DIR}/scripts/common/git.sh
source ${MY_DIR}/scripts/common/git-aliases.sh
source ${MY_DIR}/scripts/common/applications-common.sh
source ${MY_DIR}/scripts/common/configuration-osx.sh
# source ${MY_DIR}/scripts/common/configurations.sh

echo
echo "Installing most recent version of Java"
# Install AdoptOpenJDK with Homebrew (https://github.com/AdoptOpenJDK/homebrew-openjdk)
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk12

# Install JEnv to manage versions (http://www.jenv.be/)
brew install jenv
pushd $HOME
echo 'eval "$(jenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
popd

# Add newly installed OpenJDK to JEnv, and set as default version
jenv add /Library/Java/JavaVirtualMachines/adoptopenjdk-12.jdk/Contents/Home/
jenv global 12

echo
echo "Installing Intellij"
brew cask install intellij-idea

echo
echo "Installing NodeJS"
brew install node@10
brew link node@10
brew install yarn

echo "Installing Docker"
brew cask install docker

echo "===DONE==="
# source ${MY_DIR}/scripts/common/finished.sh
