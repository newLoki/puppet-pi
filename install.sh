#!/bin/bash -e
#get newest source
git pull

#check if puppet-librarian is availeable
if [ ! $(which librarian-puppet | grep "librarian-puppet") ] 
then
  #ruby-dev package is needed to build json-gem extension, which is required by librarian-puppet
  PKG_OK=$(sudo aptitude search ruby-dev|grep "i   ruby-dev")
  if [ "" == "$PKG_OK" ]; then
    sudo apt-get --force-yes --yes install ruby-dev
  fi
  
  
  #now install librarian-puppet
  sudo gem install --no-ri --no-rdoc librarian-puppet  
fi
#install dependencies
librarian-puppet install

#run puppet
sudo puppet apply --modulepath=./modules -l /tmp/puppet.log ./manifests/pi.pp
