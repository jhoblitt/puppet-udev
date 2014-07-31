# == Class: udev::params
#
# This class should be considered private.
#
class udev::params {
  $udevadm_path = '/sbin'

  case $::operatingsystem {
    'debian': {
      $udev_package = 'udev'
      $udevlogpriority = 'udevadm control --log-priority'
      $udevtrigger     = 'udevadm trigger'
    }
    'redhat': {
      case $::operatingsystemmajrelease {
        '5': {
          $udev_package = 'udev'
          $udevtrigger     = 'udevtrigger'
          $udevlogpriority = 'udevcontrol log_priority'
        }
        '6','7': {
          $udev_package = 'udev'
          $udevtrigger     = 'udevadm trigger'
          $udevlogpriority = 'udevadm control --log-priority'
        }
        default: {
          fail("Module ${module_name} is not supported on RedHat release ${::operatingsystemmajrelease}")
        }
      }
    }
    'fedora': {
      if ($::operatingsystemmajrelease >= 20) {
        $udev_package    = 'systemd'
        $udevtrigger     = 'udevadm trigger'
        $udevlogpriority = 'udevadm control --log-priority'
      }
      else {
        fail("Module ${module_name} might not be supported on Fedora release ${::operatingsystemmajrelease}")
        }
      }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
