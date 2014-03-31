require 'spec_helper'

describe 'udev::params', :type => :class do
  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should include_class('udev::params') }
  end

  describe 'for osfamily Debian' do
    let(:facts) {{ :osfamily => 'Debian' }}

    it { should include_class('udev::params') }
  end

  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Suse',
        :operatingsystem => 'OpenSuSE',
      }
    end
  
    it 'should fail' do
      expect { should include_class('udev::params') }.
        to raise_error(Puppet::Error, /not supported on OpenSuSE/)
    end
  end

end
