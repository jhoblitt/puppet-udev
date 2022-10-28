# == Class: udev::params
#
# This class should be considered private.
#
class udev::params {
  $config_file_replace = true

  $udev_log     = 'err'
  $udevadm_path = '/sbin'
  $rules        = undef

  case $::osfamily {
    'debian': {
      $udev_package    = 'udev'
      $udevlogpriority = 'udevadm control --log-priority'
      $udevtrigger     = 'udevadm trigger --action=change'
    }
    'redhat': {
      if $::operatingsystem == 'Fedora' {
        if (versioncmp($::operatingsystemmajrelease,'20') >=0) {
          $udev_package    = 'systemd'
          $udevtrigger     = 'udevadm trigger'
          $udevlogpriority = 'udevadm control --log-priority'
        }
        else {
          fail("Module ${module_name} might not be supported on Fedora release ${::operatingsystemmajrelease}")
        }
      } else {
        case $::operatingsystemmajrelease {
          '5': {
            $udev_package    = 'udev'
            $udevtrigger     = 'udevtrigger'
            $udevlogpriority = 'udevcontrol log_priority'
          }
          '6': {
            $udev_package    = 'udev'
            $udevtrigger     = 'udevadm trigger --action=change'
            $udevlogpriority = 'udevadm control --log-priority'
          }
          '7', '8', '9': {
            $udev_package    = 'systemd'
            $udevtrigger     = 'udevadm trigger --action=change'
            $udevlogpriority = 'udevadm control --log-priority'
          }
          default: {
            fail("Module ${module_name} is not supported on RedHat release ${::operatingsystemmajrelease}")
          }
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
