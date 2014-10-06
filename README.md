Sudo
=========

Puppet sudo module to manage sudoers files from hiera.

Does not have any dependencies and should work with any Puppet >= 3.0 installation or >= 2.7 if hiera is installed.

Installation
---
Place this module inside environment modules directory. That's it.

Basic usage example
------

Module searches hiera for **sudo_files** hash.
Example inside hiera.

```yaml
sudo_files: |
    john   ALL=(ALL) NOPASSWD:/usr/bin/vim, (service_group) NOPASSWD:ALL
    stan   ALL=(ALL) NOPASSWD:/usr/sbin/tcpdump

classes:
    - sudo
```

This will create /etc/sudoers.d/users with provided content.

Warning!
-------

Module overrides /etc/sudoers with file in files/default
Please pay attention to that.

No hiera?
---
You can still use this module as following:

```puppet
node /mynode/ {
    class { "sudo": filename => "users" }
}
```

And place file **users** in sudo's module files directory.
