require 'spec_helper'

describe 'udev::udevadm::trigger', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should include_class('udev::udevadm::trigger') }
    it do
      should contain_exec('udevadm trigger').with({
        :refreshonly => true,
        :path        => ['/sbin'],
      })
    end
  end

end
