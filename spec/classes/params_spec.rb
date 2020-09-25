require 'spec_helper'

describe 'udev::params', type: :class do
  describe 'for osfamily RedHat' do
    let :facts do
      {
        osfamily: 'RedHat',
        operatingsystemmajrelease: '6',
        operatingsystem: 'RedHat',
      }
    end

    it { is_expected.to contain_class('udev::params') }
  end

  describe 'for osfamily RedHat' do
    let :facts do
      {
        osfamily: 'RedHat',
        operatingsystemmajrelease: '4',
        operatingsystem: 'RedHat',
      }
    end

    it 'fails' do
      expect { is_expected.to contain_class('udev::params') }
        .to raise_error(Puppet::Error, %r{not supported on RedHat release 4})
    end
  end

  describe 'for osfamily Debian' do
    let(:facts) { { osfamily: 'Debian' } }

    it { is_expected.to contain_class('udev::params') }
  end

  describe 'unsupported osfamily' do
    let :facts do
      {
        osfamily: 'Suse',
        operatingsystem: 'OpenSuSE',
      }
    end

    it 'fails' do
      expect { is_expected.to contain_class('udev::params') }
        .to raise_error(Puppet::Error, %r{not supported on OpenSuSE})
    end
  end
end
