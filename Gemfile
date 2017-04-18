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

# rspec must be v2 for ruby 1.8.7
if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
  # rake >=11 does not support ruby 1.8.7
  gem 'rspec', '~> 2.0'
  gem 'rake', '~> 10.0'
end

# vim:ft=ruby
