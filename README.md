# JSI Vagrant

![Vagrant logo](http://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Vagrant.png/300px-Vagrant.png =100x122)

**Vagrant** is a tool for building and distributing development environments.

## Quick Start

1. Install [VirtualBox](http://www.virtualbox.org).
2. Install [Vagrant](http://www.vagrantup.com/downloads).
3. Install [Fuse and Fuse SSHFS extension](http://osxfuse.github.io/).
4. Install Vagrant plugins:

    ```
    vagrant plugin install vagrant-vbguest
    ```

5. Build your development environment:

    ```
    vagrant up
    bin/update-ssh-key
    ```

6. Mount working directory

    ```
    bin/mount
    ```