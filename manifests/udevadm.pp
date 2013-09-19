# == Class: udev::udevadm
#
# This class should not being included into the manifest directly.  It's
# function is to receive messages that the udev configuration files have
# changed.
#
# === Example
#
# file { '/etc/etc/udev/rules.d/99-myfrobnicator.rules':
#   ...
#   notify => Class['udev::udevadm'],
# }
#
class udev::udevadm inherits udev::params {

  # adding `udevadm control --reload-rules` may be needed some day for edge
  # cases.
  # http://unix.stackexchange.com/questions/39370/how-to-reload-udev-rules-without-reboot

  exec { 'udevadm trigger':
    command     => 'udevadm trigger',
    refreshonly => true,
    path        => [$udev::params::udevadm_path],
  }
}
