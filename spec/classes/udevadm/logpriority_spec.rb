require 'spec_helper'

describe 'udev::udevadm::logpriority', :type => :class do

  shared_examples 'udev_log_param' do |udev_log, params|
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
          should include_class('udev::udevadm::logpriority')
        }.to raise_error(Puppet::Error, /does not match/)
      end
    end

  end

end
