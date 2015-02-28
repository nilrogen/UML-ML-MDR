# UML-ML-MDR

## How to get this working:

* Install vagrant (https://www.vagrantup.com/)
* Install virtualbox (https://www.virtualbox.org/)
* Install a terminal with ssh (if you don't have one)
* run "vagrant up" inside this directory
* Do something else for a while
* Type into browser: localhost:8080/working.php
* If you don't see "Hello World" then send me a message.

## How to work in this environment:
After typing in "vagrant up" you are now running a ubuntu VM which is running
apache! You can use "vagrant ssh" to log into that VM. The directory "/vagrant"
contains all the shared file information between the host and VM. The symbolic
link "shared" will take you to that directory.

All work can be done either inside of the VM (using vim or emacs) 
or on your machine.

To stop the VM all you need to do is run: "vagrant halt".
If you want to destroy the VM run: "vagrant destroy". This will delete
the vm from your hard drive. 




