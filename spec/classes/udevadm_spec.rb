require 'spec_helper'

describe 'udev::udevadm', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should include_class('udev::udevadm') }
    it do
      should contain_exec('udevadm trigger').with({
        :command     => 'udevadm trigger',
        :refreshonly => true,
        :path        => ['/sbin'],
      })
    end
  end

end
