require 'spec_helper_acceptance'

describe 'udev class' do
  if $systemd
    package_name = 'systemd'
  else
    package_name = 'udev'
  end

  describe 'running puppet code' do
    let(:pp) do
      <<-EOS
        class { 'udev': udev_log => 'debug' }

        udev::rule { '51-android.rules':
          content => 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="22b8", ATTRS{idProduct}=="4372", MODE="0660", OWNER="vagrant"',
        }

        udev::rule { '60-raw.rules':
          content => 'ACTION=="add", KERNEL=="sda", RUN+="/bin/raw /dev/raw/raw1 %N"',
        }
      EOS
    end

    it 'should work with no errors' do
      idempotent_apply(pp)
    end

    describe package(package_name) do
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
end
