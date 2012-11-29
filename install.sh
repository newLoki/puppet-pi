#!/bin/bash -e
#get newest source
git pull

#check if puppet-librarian is availeable
if [ ! -e /usr/bin/librarian-puppet ] 
then
  #ruby-dev package is needed to build json-gem extension, which is required by librarian-puppet
  if [ ! `dpkg -l | grep -i 'ruby-dev'` ]
  then
    sudo apt-get install ruby-dev
  fi
  #now install librarian-puppet
  sudo gem install librarian-puppet  
fi
#install dependencies
librarian-puppet install

#run puppet
puppet apply --modulepath=./modules -l /tmp/puppet.log ./manifests/pi.pp
