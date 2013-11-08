require 'spec_helper_system'

describe 'udev class' do
  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        class { 'udev': udev_log => 'debug' }

        udev::rule { '51-android.rules':
          content => 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="22b8", ATTRS{idProduct}=="4372", MODE="0660", OWNER="vagrant"',
        }

        udev::rule { '60-raw.rules':
          content => 'ACTION=="add", KERNEL=="sda", RUN+="/bin/raw /dev/raw/raw1 %N"',
        }
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.stderr.should be_empty
        r.refresh
        r.exit_code.should be_zero
        r.stderr.should be_empty
      end
    end
  end

  describe package('udev') do
    it { should be_installed }
  end

  describe file('/etc/udev/udev.conf') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    it { should contain 'udev_log="debug"' }
  end

  describe file('/etc/udev/rules.d/51-android.rules') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    it { should contain 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="22b8", ATTRS{idProduct}=="4372", MODE="0660", OWNER="vagrant"' }
  end

  describe file('/etc/udev/rules.d/60-raw.rules') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    it { should contain 'ACTION=="add", KERNEL=="sda", RUN+="/bin/raw /dev/raw/raw1 %N"' }
  end
end
