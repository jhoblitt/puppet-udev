
#### [Current]
 * [2a30d93](../../commit/2a30d93) - __(Joshua Hoblitt)__ update jhoblitt email address
 * [e92236f](../../commit/e92236f) - __(Joshua Hoblitt)__ update copyright year (2017)
 * [7f57d80](../../commit/7f57d80) - __(Joshua Hoblitt)__ Merge pull request [#24](../../issues/24) from jhoblitt/plumbing/update

update build/test plumbing
 * [e22d9ad](../../commit/e22d9ad) - __(Joshua Hoblitt)__ add beaker:centos-7-docker to travis matrix
 * [408f695](../../commit/408f695) - __(Joshua Hoblitt)__ update beaker plumbing
 * [b3b2725](../../commit/b3b2725) - __(Joshua Hoblitt)__ add dockeer based beaker nodesets
 * [84334e8](../../commit/84334e8) - __(Joshua Hoblitt)__ remove vagrant based beaker nodesets
 * [d582c95](../../commit/d582c95) - __(Joshua Hoblitt)__ update gem set
 * [c1cc3ae](../../commit/c1cc3ae) - __(Joshua Hoblitt)__ Merge pull request [#22](../../issues/22) from nexecook/default_action

explictly use the change action for udevadm trigger
 * [5f7b5ab](../../commit/5f7b5ab) - __(Eric Cook)__ remove ruby < 2.0 testing
 * [2f5addf](../../commit/2f5addf) - __(Eric Cook)__ explictly use the change action for udevadm trigger centos 6 defaults to --action=add https://lists.ubuntu.com/archives/ubuntu-devel/2009-January/027260.html https://bugzilla.redhat.com/show_bug.cgi?id=570355
 * [4abfdeb](../../commit/4abfdeb) - __(Joshua Hoblitt)__ Merge pull request [#16](../../issues/16) from noodle10000/master

Fix params.pp where Fedora release version is checked
 * [1dedeb2](../../commit/1dedeb2) - __(Craig Smith)__ typo, need to quote the string to compare $::operatingsystemmajrelease to
 * [675434c](../../commit/675434c) - __(Craig Smith)__ use versioncmp to compare fedora release (in puppet v4 $::operatingsystemmajrelease is treated strictly as a string)
 * [e834722](../../commit/e834722) - __(Joshua Hoblitt)__ Merge pull request [#13](../../issues/13) from ajmaidak/4xparser

operatingsystemmajrelease fact is a string
 * [8d595c7](../../commit/8d595c7) - __(Alexander J. Maidak)__ Cleanup tests for int->string conversion on facts

4x does not magically convert between ints and strings
for facts.

 * [6c13c64](../../commit/6c13c64) - __(Alexander J. Maidak)__ operatingsystemmajrelease fact is a string

Fix params.pp for 4x parser.  The puppet 4x parser is type sensitive,
strings are not magically converted to ints and vice-versa.  The
operatingsystemmajrelease fact is returned by facter as a string:
https://tickets.puppetlabs.com/browse/FACT-962

 * [dd9141f](../../commit/dd9141f) - __(Joshua Hoblitt)__ Merge pull request [#12](../../issues/12) from jhoblitt/feature/v2.1.0

bump version to v2.1.0
 * [82a8239](../../commit/82a8239) - __(Joshua Hoblitt)__ bump version to v2.1.0
 * [42e0b46](../../commit/42e0b46) - __(Joshua Hoblitt)__ additional puppet 4 compatibility
 * [4670766](../../commit/4670766) - __(Joshua Hoblitt)__ add official support for el7.x
 * [178bafa](../../commit/178bafa) - __(Joshua Hoblitt)__ fix whitespace issues
 * [8e273a6](../../commit/8e273a6) - __(Sam Wouters)__ On RH7 udev is provided by systemd package
 * [357b821](../../commit/357b821) - __(Joshua Hoblitt)__ Merge pull request [#11](../../issues/11) from jhoblitt/feature/v2.0.0

Feature/v2.0.0
 * [a3a45b6](../../commit/a3a45b6) - __(Joshua Hoblitt)__ bump version to v2.0.0
 * [75a7d2f](../../commit/75a7d2f) - __(Joshua Hoblitt)__ add Puppet Version Compatibility subsection to README
 * [8c37d19](../../commit/8c37d19) - __(Joshua Hoblitt)__ update README boilerplate
 * [141af06](../../commit/141af06) - __(Joshua Hoblitt)__ fix rspec puppet 4 compatibility
 * [eb534db](../../commit/eb534db) - __(Joshua Hoblitt)__ remove default nodset symlink

To resolve this PMT error:
    Puppet::ModuleTool::Errors::ModuleToolError: Found symlinks. Symlinks in modules are not allowed, please remove them.

 * [422cb4f](../../commit/422cb4f) - __(Joshua Hoblitt)__ add centos 5.11 nodeset
 * [db13f26](../../commit/db13f26) - __(Joshua Hoblitt)__ add puppet-blacksmith gem
 * [b07fe5d](../../commit/b07fe5d) - __(Joshua Hoblitt)__ add travis_lint rake target
 * [7c81d5d](../../commit/7c81d5d) - __(Joshua Hoblitt)__ add debian 7.8 nodeset
 * [6c88e12](../../commit/6c88e12) - __(Joshua Hoblitt)__ fix trailing whitespace
 * [26635ed](../../commit/26635ed) - __(Joshua Hoblitt)__ update copyright notice year to 2015
 * [239cc2e](../../commit/239cc2e) - __(Joshua Hoblitt)__ add ruby 2.2 to travis matrix
 * [1adaa87](../../commit/1adaa87) - __(Joshua Hoblitt)__ add :validate to default rake target list
 * [3df1503](../../commit/3df1503) - __(Joshua Hoblitt)__ add metadata-json-lint gem

Needed by rake metadata.json validation target.

 * [c8317bc](../../commit/c8317bc) - __(Joshua Hoblitt)__ set stdlib requirement to 4.6.0
 * [7bf7075](../../commit/7bf7075) - __(Joshua Hoblitt)__ update travis matrix puppet 3.x minimum version to 3.7
 * [27a8ec2](../../commit/27a8ec2) - __(Joshua Hoblitt)__ update rspec-puppet gem version to ~> 2.1.0

For compatibility with puppet 4.0.0

 * [41db90e](../../commit/41db90e) - __(Joshua Hoblitt)__ add junit/ to .gitiginore

Generated by beaker 5

 * [8d0f1d8](../../commit/8d0f1d8) - __(Joshua Hoblitt)__ add puppet 4.0 to travis matrix
 * [a818174](../../commit/a818174) - __(Joshua Hoblitt)__ remove puppet 2.7 from travis matrix

4.0.0 has been released; support major release -1

 * [308c056](../../commit/308c056) - __(Joshua Hoblitt)__ update beaker nodesets to use current chef/bento boxes
 * [46b27e7](../../commit/46b27e7) - __(Joshua Hoblitt)__ add log/ to .gitignore

Generated by beaker during execution.

 * [e0c078a](../../commit/e0c078a) - __(Joshua Hoblitt)__ pin rspec on Ruby 1.8.7 (rspec/rspec-core[#1864](../../issues/1864))
 * [0e5fc57](../../commit/0e5fc57) - __(Joshua Hoblitt)__ use rspec-puppet 2.0.0 from gems instead of git
 * [fa14583](../../commit/fa14583) - __(Joshua Hoblitt)__ add FACTER_GEM_VERSION to Gemfile
 * [1eaabfc](../../commit/1eaabfc) - __(Joshua Hoblitt)__ convert Modulefile to metadata.json
 * [14f8124](../../commit/14f8124) - __(Joshua Hoblitt)__ update spec_helper_acceptance to use #puppet_module_install

Instead of custom scp logic

 * [58e70d6](../../commit/58e70d6) - __(Joshua Hoblitt)__ change nodeset default to centos-65-x64
 * [ea9e721](../../commit/ea9e721) - __(Joshua Hoblitt)__ add beaker nodeset for centos 7
 * [51eceb9](../../commit/51eceb9) - __(Joshua Hoblitt)__ add beaker support
 * [6976838](../../commit/6976838) - __(Joshua Hoblitt)__ enable travis container based builds
 * [394d279](../../commit/394d279) - __(Joshua Hoblitt)__ update rspec-puppet to v2.0.0 git tag
 * [957f2a8](../../commit/957f2a8) - __(Joshua Hoblitt)__ tidy Gemfile formatting
 * [92d3172](../../commit/92d3172) - __(Joshua Hoblitt)__ fail on linter warnings
 * [9127e66](../../commit/9127e66) - __(Joshua Hoblitt)__ Merge pull request [#9](../../issues/9) from jhoblitt/feature/future_parser

add future parser to travis matrix
 * [cfe424e](../../commit/cfe424e) - __(Joshua Hoblitt)__ add future parser to travis matrix
 * [4c3289e](../../commit/4c3289e) - __(Joshua Hoblitt)__ Merge pull request [#8](../../issues/8) from jhoblitt/feature/v1.2.0

bump version to v1.2.0
 * [7a65811](../../commit/7a65811) - __(Joshua Hoblitt)__ bump version to v1.2.0
 * [7ae9cb7](../../commit/7ae9cb7) - __(Joshua Hoblitt)__ Merge pull request [#6](../../issues/6) from oholiab/master

Case out unused parameters in rules.pp
 * [f212f03](../../commit/f212f03) - __(Joshua Hoblitt)__ Merge pull request [#7](../../issues/7) from pecastro/master

Allow usage on more recent Fedora systems.
 * [afd6ec5](../../commit/afd6ec5) - __(Paulo E. Castro)__ Reinstate the operatingsystem check.
 * [6cab5a5](../../commit/6cab5a5) - __(Paulo E. Castro)__ Allow usage on more recent Fedora systems.
 * [a9ac08d](../../commit/a9ac08d) - __(Matt Carroll)__ Case out unused parameters in rules.pp

Was breaking because of empty source in puppet 3.6.2

#### v1.1.0
 * [f936f90](../../commit/f936f90) - __(Joshua Hoblitt)__ Merge pull request [#5](../../issues/5) from jhoblitt/feature/v1.1.0

bump version to v1.1.0
 * [292831d](../../commit/292831d) - __(Joshua Hoblitt)__ add el5.x to supported platforms list
 * [183c640](../../commit/183c640) - __(Joshua Hoblitt)__ bump version to v1.1.0
 * [5fc917e](../../commit/5fc917e) - __(Joshua Hoblitt)__ Merge pull request [#4](../../issues/4) from nosolutions/rhel5
 * [5340961](../../commit/5340961) - __(Joshua Hoblitt)__ update travis matrix
 * [308052a](../../commit/308052a) - __(Joshua Hoblitt)__ update .gitignore
 * [df9fe39](../../commit/df9fe39) - __(Joshua Hoblitt)__ update LICNESE copyright notice
 * [904a9ce](../../commit/904a9ce) - __(Klaus Wagner)__ Extend module to support RHEL5 as well because the udev utilies have different names. Also implement a protection method udev.conf in case override is not expected. (New param config_file_replace)
 * [2111a85](../../commit/2111a85) - __(Klaus Wagner)__ Change stdlib uri to http for easier calling behind proxy

#### v1.0.3
 * [64ba826](../../commit/64ba826) - __(Joshua Hoblitt)__ bump version to v1.0.3
 * [00253ed](../../commit/00253ed) - __(Joshua Hoblitt)__ Merge pull request [#3](../../issues/3) from Mayflower/support_ubuntu

add osfamily debian to params
 * [92f8e41](../../commit/92f8e41) - __(codec)__ update spec to fail on OpenSuSE / incl. Debian
 * [2a781a0](../../commit/2a781a0) - __(codec)__ add osfamily debian to params

#### v1.0.2
 * [bf84ffb](../../commit/bf84ffb) - __(Joshua Hoblitt)__ bump version to v1.0.2
 * [19ca764](../../commit/19ca764) - __(Joshua Hoblitt)__ fix resource ordering + implement anchor pattern
 * [c8f12f3](../../commit/c8f12f3) - __(Joshua Hoblitt)__ add simple rspec-system tests
 * [d9fa183](../../commit/d9fa183) - __(Joshua Hoblitt)__ fix erb local variable warning

    Warning: Variable access via 'udev_log' is deprecated. Use '@udev_log' instead. template[/etc/puppet/modules/udev/templates/udev.conf.erb]:4

#### v1.0.1
 * [5dc0074](../../commit/5dc0074) - __(Joshua Hoblitt)__ bump version to v1.0.1
 * [ac1f89d](../../commit/ac1f89d) - __(Joshua Hoblitt)__ add compatibility with older puppet 2.7.x
 * [f8bebb9](../../commit/f8bebb9) - __(Joshua Hoblitt)__ update README boilerplate sections, formatting, and ToC
 * [e077a61](../../commit/e077a61) - __(Joshua Hoblitt)__ add :require to all gems in Gemfile
 * [84ba892](../../commit/84ba892) - __(Joshua Hoblitt)__ add puppet 2.7.3 (fixed version) to travis matrix
 * [22f58cc](../../commit/22f58cc) - __(Joshua Hoblitt)__ change travis puppet 2.7.0 -> 2.7.1

#### v1.0.0
 * [1257c33](../../commit/1257c33) - __(Joshua Hoblitt)__ change version to v1.0.0
 * [ba528ec](../../commit/ba528ec) - __(Joshua Hoblitt)__ change stdlib dep to v3.0.0

The oldest version with `ensure_resource()`

 * [8e01b22](../../commit/8e01b22) - __(Joshua Hoblitt)__ add a blurb about concat to the README
 * [25c837e](../../commit/25c837e) - __(Joshua Hoblitt)__ missing comma in README example
 * [3a469e7](../../commit/3a469e7) - __(Joshua Hoblitt)__ simplify udev::rule implementation
 * [a69f1b8](../../commit/a69f1b8) - __(Joshua Hoblitt)__ rename udev::udevadm -> udev::udevadm::trigger

For naming consistency with udev::udevadm::logpriority

 * [1ca5e24](../../commit/1ca5e24) - __(Joshua Hoblitt)__ README fixes
 * [35266b7](../../commit/35266b7) - __(Joshua Hoblitt)__ add puppet 3.3.0 to travis test matrix
 * [fedd155](../../commit/fedd155) - __(Joshua Hoblitt)__ add syslog verbosity management
 * [db481ed](../../commit/db481ed) - __(Joshua Hoblitt)__ suppress lint warnings
 * [227ab81](../../commit/227ab81) - __(Joshua Hoblitt)__ README update
 * [252b81c](../../commit/252b81c) - __(Joshua Hoblitt)__ fix Modulefile to be valid
 * [8e79572](../../commit/8e79572) - __(Joshua Hoblitt)__ add class udev::rule to manage device rule files
 * [112ebab](../../commit/112ebab) - __(Joshua Hoblitt)__ add class udev::udevadm to manage `udevadm trigger`
 * [b6821fe](../../commit/b6821fe) - __(Joshua Hoblitt)__ add udev package installation support
 * [738cea0](../../commit/738cea0) - __(Joshua Hoblitt)__ Merge puppet-module_skel
 * [4f9f7c8](../../commit/4f9f7c8) - __(Joshua Hoblitt)__ first commit
