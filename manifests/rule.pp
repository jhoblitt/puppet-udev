# == Define: udev::rule
#
# Manage a udev rules file and trigger udev to reload it's device rules upon
# modification.
#
# === Parameters
#
# Note that either *content* or *source* must be specified unless *ensure* is
# 'absent'.
#
# [*ensure*]
#
# String.  Possible values: 'present', 'absent'
#
# Controls the state of the udev rule file.
#
# Default: 'present'
#
# [*content*]
#
# String.
#
# A literal string of the content that is to appear in udev rule file.  This
# parameter is mutually exclusive with *source*.
#
# Default: undef
#
# [*source*]
#
# String.
#
# The URI to pull the udev rule file content from.  This parameter is mutually
# exclusive with *content*.  Eg.  'puppet:///modules/mysite/myrule.rules'.
#
# Default: undef
#
#
# === Example
#
define udev::rule(
  $ensure  = present,
  $content = undef,
  $source  = undef,
) {
  validate_re($ensure, '^present$|^absent$')

  include udev

  # only $source or $content are allowed
  if $source {
    validate_string($source)

    if $content {
      fail("${title}: parameters \$source and \$content are mutually exclusive")
    }

    $safe_source = { source => $source }
  } elsif $content {
    validate_string($content)

    if $source {
      fail("${title}: parameters \$source and \$content are mutually exclusive")
    }

    $safe_content = { content => $content }
  } else {
    # one of $source or $content is required unless we're removing the file,
    if $ensure != 'absent' {
      fail("${title}: parameter \$source or \$content is required")
    }
  }

  $config = {
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['udev::udevadm'],
  }

  $safe_config = merge(
    $config,
    $safe_source,
    $safe_content
  )

  create_resources( 'file', { "/etc/udev/rules.d/${title}" => $safe_config } )

}
