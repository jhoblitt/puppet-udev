# == Class: udev::udevadm::trigger
#
# This class should not being included into the manifest directly.  It's
# function is to receive messages that the udev configuration files have
# changed.
#
# === Example
#
# file { '/etc/etc/udev/rules.d/99-myfrobnicator.rules':
#   ...
#   notify => Class['udev::udevadm::trigger'],
# }
#
class udev::udevadm::trigger inherits udev::params {

  # adding `udevadm control --reload-rules` may be needed some day for edge
  # cases.
  # http://unix.stackexchange.com/questions/39370/how-to-reload-udev-rules-without-reboot

  exec { $udev::params::udevtrigger:
    refreshonly => true,
    path        => [$udev::params::udevadm_path],
  }
}
