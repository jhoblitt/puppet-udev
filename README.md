Puppet udev Module
=========================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-udev.png)](https://travis-ci.org/jhoblitt/puppet-udev)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
5. [Support](#support)


Overview
--------

Manages the udev package


Description
-----------

This module installs and manages the
[`udev`](http://www.freedesktop.org/software/systemd/man/udev.html) package.

Usage
-----

```puppet
    include udev
```

### Manually trigging a udev rules reload

```puppet
    file { '/etc/etc/udev/rules.d/99-myfrobnicator.rules':
      ...
      notify => Class['udev::udevadm'],
    }
```


Limitations
-----------

At present, only support for `$::osfamily == 'RedHat'` has been implimented.
Adding other Linux distrubtions should be trivial.

### Tested Platforms

* el6.x


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-udev/issues)

