# == Class: udev
#
# simple template
#
class udev inherits udev::params {
  package{ $udev::params::udev_package:
    ensure => present,
  }
}
