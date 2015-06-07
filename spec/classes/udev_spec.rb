require 'spec_helper'

describe 'udev', :type => :class do

  shared_examples 'udev_log_param' do |udev_log, config_file_replace, params|
    let(:params) { params }

    it do
      should contain_class('udev')
      should contain_package('udev').with_ensure('present')
      should contain_file('/etc/udev/udev.conf').
        with({
          :ensure              => 'file',
          :owner               => 'root',
          :group               => 'root',
          :mode                => '0644',
          :config_file_replace => $config_file_replace,
        }).
        with_content(/udev_log="#{udev_log}"/)
      should contain_class('udev::udevadm::trigger')
      should contain_class('udev::udevadm::logpriority').
        with_udev_log(udev_log)
    end
  end

  describe 'for osfamily RedHat' do
    let :facts do
      {
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => 6,
      }
    end

    describe 'no params' do
      it_behaves_like('udev_log_param', 'err', true, {})
    end

    describe 'udev_log => err, config_file_replace => true' do
      it_behaves_like('udev_log_param', 'err', true, { :udev_log => 'err', :config_file_replace => true })
    end

    describe 'udev_log => info, config_file_replace => true' do
      it_behaves_like('udev_log_param', 'info', true, { :udev_log => 'info', :config_file_replace => true })
    end

    describe 'udev_log => debug, config_file_replace => true' do
      it_behaves_like('udev_log_param', 'debug', true, { :udev_log => 'debug', :config_file_replace => true })
    end

    describe 'udev_log => err, config_file_replace => false' do
      it_behaves_like('udev_log_param', 'err', false, { :udev_log => 'err', :config_file_replace => false })
    end

    describe 'udev_log => info, config_file_replace => false' do
      it_behaves_like('udev_log_param', 'info', false, { :udev_log => 'info', :config_file_replace => false })
    end

    describe 'udev_log => debug, config_file_replace => false' do
      it_behaves_like('udev_log_param', 'debug', false, { :udev_log => 'debug', :config_file_replace => false })
    end

    describe 'udev_log => invalid' do
      let(:params) {{ :udev_log => 'invalid' }}

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /does not match/)
      end
    end

    describe 'config_file_replace => invalid' do
      let(:params) {{ :config_file_replace => 'invalid' }}

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /is not a boolean/)
      end
    end

  end

end
