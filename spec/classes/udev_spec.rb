require 'spec_helper'

describe 'udev', :type => :class do

  shared_examples 'udev_log_param' do |udev_log, params|
    let(:params) { params }

    it do
      should include_class('udev')
      should contain_package('udev').with_ensure('present')
      should contain_file('/etc/udev/udev.conf').
        with({
          :ensure  => 'file',
          :owner   => 'root',
          :group   => 'root',
          :mode    => '0644',
        }).
        with_content(/udev_log="#{udev_log}"/)
      should contain_class('udev::udevadm::trigger')
      should contain_class('udev::udevadm::logpriority').
        with_udev_log(udev_log)
    end
  end

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    describe 'no params' do
      it_behaves_like('udev_log_param', 'err', {})
    end

    describe 'udev_log => err' do
      it_behaves_like('udev_log_param', 'err', { :udev_log => 'err' })
    end

    describe 'udev_log => info' do
      it_behaves_like('udev_log_param', 'info', { :udev_log => 'info' })
    end

    describe 'udev_log => debug' do
      it_behaves_like('udev_log_param', 'debug', { :udev_log => 'debug' })
    end

    describe 'udev_log => invalid' do
      let(:params) {{ :udev_log => 'invalid' }}

      it 'should fail' do
        expect {
          should include_class('udev')
        }.to raise_error(Puppet::Error, /does not match/)
      end
    end

  end

end
