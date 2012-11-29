#!/bin/bash -e
#get newest source
git pull

#check if puppet-librarian is availeable
if [ ! -e /usr/bin/librarian-puppet ] 
then
  #ruby-dev package is needed to build json-gem extension, which is required by librarian-puppet
  PKG_OK=$(dpkg-query -W --showformat='${Status}\n' ruby-dev|grep "install ok installed")
  if [ "" == "$PKG_OK" ]; then
    sudo apt-get --force-yes --yes install ruby-dev
  fi
  
  
  #now install librarian-puppet
  sudo gem install --no-ri --no-rdoc librarian-puppet  
fi
#install dependencies
librarian-puppet install

#run puppet
puppet apply --modulepath=./modules -l /tmp/puppet.log ./manifests/pi.pp
