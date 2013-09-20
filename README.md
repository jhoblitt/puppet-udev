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

Manages the udev package and device rules


Description
-----------

This module installs and manages the
[`udev`](http://www.freedesktop.org/software/systemd/man/udev.html) package.

Usage
-----

### Basic Example

This class does not need to be manually included in the manifest when using the
`udev::rule` defined type.

```puppet
    include udev
```

### Managing `udev` syslog verbosity

Controls the value of `udev_log` in `udev.conf` and change the runtime syslog
verbosity of the daemon.

```puppet
    class { 'udev': udev_log => 'debug' }
```

### Managing `udev` rules

Note that either the `content` or `source` parameter must be specified unless
`ensure` is `absent`and that these parameters are mutually exclusive; you can
not specify both.

```puppet
    udev::rule { '60-raw.rules':
      ensure  => present,
      content => 'ACTION=="add", KERNEL=="sda", RUN+="/bin/raw /dev/raw/raw1 %N"',
    }
```

As is commonly done with the `file` type, you can pass the output of the `template()` function to `content`.

```puppet
    udev::rule { '99-foo.rules':
      ensure  => present,
      content => template('mymodule/foo.rules.erb'),
    }
```

```puppet
    udev::rule { '99-foo.rules':
      ensure  => present,
      source  => "puppet:///modules/${module_name}/foo.rules"
    }
```

```puppet
    udev::rule { '99-foo.rules':
      ensure  => absent,
    }
```


### Manually triggering a `udev` device rules reload

```puppet
    file { '/etc/etc/udev/rules.d/99-myfrobnicator.rules':
      ...
      notify => Class['udev::udevadm'],
    }
```


Limitations
-----------

At present, only support for `$::osfamily == 'RedHat'` has been implemented.
Adding other Linux distributions should be trivial.

### Tested Platforms

* el6.x


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-udev/issues)

