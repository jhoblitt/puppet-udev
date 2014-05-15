require 'spec_helper'

describe 'udev::udevadm::logpriority', :type => :class do

  shared_examples 'udev_log_param_redhat_6' do |udev_log, params|
    let(:params) { params }

    it do
      should contain_class('udev::udevadm::logpriority').
        with_udev_log(udev_log)
      should contain_exec("udevadm control --log-priority=#{udev_log}").with({
        :refreshonly => true,
        :path        => '/sbin',
      })
    end
  end

  shared_examples 'udev_log_param_redhat_5' do |udev_log, params|
    let(:params) { params }

    it do
      should contain_class('udev::udevadm::logpriority').
        with_udev_log(udev_log)
      should contain_exec("udevcontrol log_priority=#{udev_log}").with({
        :refreshonly => true,
        :path        => '/sbin',
      })
    end
  end

  describe 'for osfamily RedHat and operatingsystemmajrelease 6' do
    let(:facts) do
        { :osfamily                  => 'RedHat',
          :operatingsystemmajrelease => '6',
        }
    end

    describe 'no params' do
      it_behaves_like('udev_log_param_redhat_6', 'err', {})
    end

    describe 'udev_log => err' do
      it_behaves_like('udev_log_param_redhat_6', 'err', { :udev_log => 'err' })
    end

    describe 'udev_log => info' do
      it_behaves_like('udev_log_param_redhat_6', 'info', { :udev_log => 'info' })
    end

    describe 'udev_log => debug' do
      it_behaves_like('udev_log_param_redhat_6', 'debug', { :udev_log => 'debug' })
    end

    describe 'udev_log => invalid' do
      let(:params) {{ :udev_log => 'invalid' }}

      it 'should fail' do
        expect {
          should contain_class('udev::udevadm::logpriority')
        }.to raise_error(Puppet::Error, /does not match/)
      end
    end

  end

  describe 'for osfamily RedHat and operatingsystemmajrelease 5' do
    let(:facts) do
        { :osfamily                  => 'RedHat',
          :operatingsystemmajrelease => '5',
        }
    end

    describe 'no params' do
      it_behaves_like('udev_log_param_redhat_5', 'err', {})
    end

    describe 'udev_log => err' do
      it_behaves_like('udev_log_param_redhat_5', 'err', { :udev_log => 'err' })
    end

    describe 'udev_log => info' do
      it_behaves_like('udev_log_param_redhat_5', 'info', { :udev_log => 'info' })
    end

    describe 'udev_log => debug' do
      it_behaves_like('udev_log_param_redhat_5', 'debug', { :udev_log => 'debug' })
    end

    describe 'udev_log => invalid' do
      let(:params) {{ :udev_log => 'invalid' }}

      it 'should fail' do
        expect {
          should contain_class('udev::udevadm::logpriority')
        }.to raise_error(Puppet::Error, /does not match/)
      end
    end

  end

end
