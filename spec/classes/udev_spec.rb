require 'spec_helper'

describe 'udev', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    it { should include_class('udev') }
    it { should contain_package('udev').with_ensure(:present) }
  end

end
