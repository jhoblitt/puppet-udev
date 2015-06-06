# == Class: udev::udevadm::logpriority
#
# Set the udev daemon runtime log level.
#
# This class does nothing unless it receives a *notify* message.
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
# class { 'udev::udevadm::logpriority': udev_log => 'debug' }
#
#
class udev::udevadm::logpriority(
  $udev_log = 'err'
) inherits udev::params {
  validate_re($udev_log, '^err$|^info$|^debug$')

  exec { "${udev::params::udevlogpriority}=${udev_log}":
    refreshonly => true,
    path        => $udev::params::udevadm_path,
  }
}
