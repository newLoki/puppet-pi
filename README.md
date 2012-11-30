#Puppet configurations for my Raspberry Pi

This repository contains all my configurations, which I need to work on
Raspberry Pi.

##Prequisites
* Ruby (```sudo apt-get install ruby```)
* Git (```sudo apt-get install git-core```)
* Puppet (```sudo gem install facter puppet --no-ri --no-rdoc```)

##Installation

Only run ```git clone https://github.com/newLoki/puppet-pi.git && puppet-pi/install.sh``


###Generate preinstalled disk (only working on debian)
1. Install prequisites (```apt-get install binfmt-support qemu qemu-user-static
   debootstrap kpartx lvm2 dosfstools```)
2. Mount the sd card to /dev/sdc
3. Create a new image (```sudo create_image.sh /dev/sdc```)
4. Move image to sd card (```sudo dd if=<image file> of=<blockdevice of your SD
   card> bs=1M```)
