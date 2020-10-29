require 'spec_helper_acceptance'

describe 'udev class' do
  package_name = if run_shell('ps -p 1 -o comm=').stdout =~ %r{systemd}
                   'systemd'
                 else
                   'udev'
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

    it 'works with no errors' do
      idempotent_apply(pp)
    end

    describe package(package_name) do
      it { is_expected.to be_installed }
    end

    describe file('/etc/udev/udev.conf') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode 644 }
      it { is_expected.to contain 'udev_log="debug"' }
    end

    describe file('/etc/udev/rules.d/51-android.rules') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode 644 }
      it { is_expected.to contain 'SUBSYSTEMS=="usb", ATTRS{idVendor}=="22b8", ATTRS{idProduct}=="4372", MODE="0660", OWNER="vagrant"' }
    end

    describe file('/etc/udev/rules.d/60-raw.rules') do
      it { is_expected.to be_file }
      it { is_expected.to be_owned_by 'root' }
      it { is_expected.to be_grouped_into 'root' }
      it { is_expected.to be_mode 644 }
      it { is_expected.to contain 'ACTION=="add", KERNEL=="sda", RUN+="/bin/raw /dev/raw/raw1 %N"' }
    end
  end
end
