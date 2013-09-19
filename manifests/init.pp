# == Class: udev
#
# Manages the udev package and device rules
#
# This class does not need to be declared in the manfiest when using the
# udev::rule defined type.
#
# === Examples
#
# include udev
#
class udev inherits udev::params {

  package{ $udev::params::udev_package:
    ensure => present,
  }

  class { 'udev::udevadm': } ->
  Class['udev']
}
