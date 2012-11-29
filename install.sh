#get newest source
git pull

#check if puppet-librarian is availeable
if [ ! -e /usr/bin/librarian-puppet ] then
  sudo gem install librarian-puppet  
fi
#install dependencies
librarian-puppet install

#run puppet
puppet apply --modulepath=./modules -l /tmp/puppet.log ./manifests/pi.pp
