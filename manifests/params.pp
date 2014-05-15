# == Class: udev::params
#
# This class should be considered private.
#
class udev::params {
  $udev_package = 'udev'
  $udevadm_path = '/sbin'

  case $::osfamily {
    'debian': {
      $udevlogpriority = 'udevadm control --log-priority'
      $udevtrigger     = 'udevadm trigger'
    }
    'redhat': {
      case $::operatingsystemmajrelease {
        '5': {
          $udevtrigger     = 'udevtrigger'
          $udevlogpriority = 'udevcontrol log_priority'
        }
        '6','7': {
          $udevtrigger     = 'udevadm trigger'
          $udevlogpriority = 'udevadm control --log-priority'
        }
        default: {
          fail("Module ${module_name} is not supported on RedHat release ${::operatingsystemmajrelease}")
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
