require 'spec_helper'

describe 'udev', :type => :class do

  describe 'for osfamily RedHat' do
    it { should contain_class('udev') }
  end

end
