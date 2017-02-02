require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'
require 'beaker/puppet_install_helper'

# Install Puppet
unless ENV['RS_PROVISION'] == 'no'
  ENV['PUPPET_INSTALL_TYPE'] ||= 'agent'
  # puppet_install_helper does not understand pessimistic version constraints
  # so we are ignoring PUPPET_VERSION.  Use PUPPET_INSTALL_VERSION instead.
  ENV.delete 'PUPPET_VERSION'
  run_puppet_install_helper
end

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  # Readable test descriptions
  c.formatter = :documentation

  c.before :suite do
    # Install module and dependencies
    hosts.each do |host|
      copy_module_to(host, :source => proj_root, :module_name => 'udev')

      on host, puppet('module', 'install', 'puppetlabs-stdlib'), {:acceptable_exit_codes => [0, 1]}
      on host, puppet('module', 'install', 'stahnma-epel'), {:acceptable_exit_codes => [0, 1]}
    end
  end
end

def apply(pp, options = {})
  if ENV.key?('PUPPET_DEBUG')
    options[:debug] = true
  end

  apply_manifest(pp, options)
end

# Run it twice and test for idempotency
def apply2(pp)
  apply(pp, :catch_failures => true)
  apply(pp, :catch_changes => true)
end

# probe stolen from:
# https://github.com/camptocamp/puppet-systemd/blob/master/lib/facter/systemd.rb#L26
#
# See these issues for an explination of why this is nessicary rather than
# using fact() from beaker-facter in the DSL:
#
# https://tickets.puppetlabs.com/browse/BKR-1040
# https://tickets.puppetlabs.com/browse/BKR-1041
#
if shell('ps -p 1 -o comm=').stdout =~ /systemd/
  $systemd = true
else
  $systemd = false
end
