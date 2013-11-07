# == Class: udev
#
# Manages the udev package and device rules
#
# This class does not need to be declared in the manfiest when using the
# udev::rule defined type.
#
#
# === Parameters
#
# [*udev_log*]
#
# String. Possible values: 'err, 'info', 'debug'
#
# Default: 'err'
#
#
# === Examples
#
# include udev
#
class udev(
  $udev_log = 'err'
) inherits udev::params {
  validate_re($udev_log, '^err$|^info$|^debug$')

  package{ $udev::params::udev_package:
    ensure => present,
  } ->
  file { '/etc/udev/udev.conf':
    ensure  => file,
    content => template("${module_name}/udev.conf.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['udev::udevadm::logpriority'],
  }

  class { 'udev::udevadm::trigger': } ->
  class { 'udev::udevadm::logpriority': udev_log => $udev_log } ->
  Class['udev']
}
