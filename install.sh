#get newest source
git pull
puppet apply --modulepath=./modules -l /tmp/puppet.log ./manifests/pi.pp
