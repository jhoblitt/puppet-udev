# == Class: udev::params
#
# This class should be considered private.
#
class udev::params {
  $udev_package = 'udev'
  $udevadm_path = '/sbin'

  case $::osfamily {
    'redhat': {}
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
