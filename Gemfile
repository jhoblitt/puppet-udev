source 'https://rubygems.org'

gem 'metadata-json-lint',                            :require => false
gem 'puppet', ENV['PUPPET_GEM_VERSION'] || '~> 4.9', :require => false
gem 'puppetlabs_spec_helper', '~> 1.2',              :require => false
gem 'puppet-lint', '~> 2.0',                         :require => false
gem 'puppet-syntax',                                 :require => false
gem 'rake',                                          :require => false
gem 'rspec-puppet', '~> 2.5.0',                      :require => false
gem 'travis', '~> 1.8',                              :require => false

group :release do
  gem 'puppet-blacksmith', :require => false
end

group :beaker do
  gem 'beaker-puppet_install_helper', :require => false
  gem 'beaker-rspec', '~> 6.0.0',     :require => false
  gem 'serverspec',                   :require => false
end

# vim:ft=ruby
