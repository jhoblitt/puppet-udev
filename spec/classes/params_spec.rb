require 'spec_helper'

describe 'udev::params', :type => :class do
  describe 'for osfamily RedHat' do
    let :facts do 
      {
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '6',
      }
    end
  

    it { should contain_class('udev::params') }
  end

  describe 'for osfamily RedHat' do
    let :facts do 
      {
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '4',
      }
    end
  
    it 'should fail' do
      expect { should contain_class('udev::params') }.
        to raise_error(Puppet::Error, /not supported on RedHat release 4/)
    end
  end

  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Debian',
        :operatingsystem => 'Debian',
      }
    end
  
    it 'should fail' do
      expect { should contain_class('udev::params') }.
        to raise_error(Puppet::Error, /not supported on Debian/)
    end
  end

end
