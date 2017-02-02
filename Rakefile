require 'puppetlabs_spec_helper/rake_tasks'

begin
  require 'puppet_blacksmith/rake_tasks'
rescue LoadError
end

PuppetLint.configuration.send("disable_class_inherits_from_params_class")
PuppetLint.configuration.send("disable_80chars")
PuppetLint.configuration.ignore_paths = ['pkg/**/*.pp', 'spec/**/*.pp', 'tests/**/*.pp']
PuppetSyntax.exclude_paths = ['spec/fixtures/**/*']

PuppetLint::RakeTask.new :lint do |config|
  config.pattern          = 'manifests/**/*.pp'
  config.fail_on_warnings = true
end

namespace :travis do
  desc 'Syntax check travis.yml'
  task :lint do
    sh "travis lint --exit-code --skip-completion-check" do |ok, res|
      unless ok
        # exit without verbose rake error message
        exit res.exitstatus
      end
    end
  end
end

task :default => [
  :validate,
  :lint,
  :spec,
]
