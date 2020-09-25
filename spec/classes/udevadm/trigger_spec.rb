require 'spec_helper'

describe 'udev::udevadm::trigger', type: :class do
  describe 'for osfamily RedHat' do
    let(:facts) do
      { osfamily: 'RedHat',
        operatingsystemmajrelease: '6',
        operatingsystem: 'RedHat' }
    end

    it { is_expected.to contain_class('udev::udevadm::trigger') }
    it do
      is_expected.to contain_exec('udevadm trigger --action=change').with(refreshonly: true,
                                                                          path: ['/sbin'])
    end
  end

  describe 'for osfamily RedHat' do
    let(:facts) do
      { osfamily: 'RedHat',
        operatingsystemmajrelease: '5',
        operatingsystem: 'RedHat' }
    end

    it { is_expected.to contain_class('udev::udevadm::trigger') }
    it do
      is_expected.to contain_exec('udevtrigger').with(refreshonly: true,
                                                      path: ['/sbin'])
    end
  end
end
