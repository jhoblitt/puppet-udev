require 'spec_helper'

describe 'udev', type: :class do
  shared_examples 'udev_log_param' do |udev_log, config_file_replace, params|
    let(:params) { params }

    it do
      is_expected.to contain_class('udev')
      is_expected.to contain_package('udev').with_ensure('present')
      is_expected.to contain_file('/etc/udev/udev.conf')
        .with(ensure: 'file',
              owner: 'root',
              group: 'root',
              mode: '0644',
              replace: config_file_replace)
        .with_content(%r{udev_log="#{udev_log}"})
      is_expected.to contain_class('udev::udevadm::trigger')
      is_expected.to contain_class('udev::udevadm::logpriority')
        .with_udev_log(udev_log)
    end
  end

  describe 'for osfamily RedHat' do
    let :facts do
      {
        osfamily: 'RedHat',
        operatingsystemmajrelease: '6',
        operatingsystem: 'RedHat',
      }
    end

    describe 'no params' do
      it_behaves_like('udev_log_param', 'err', true, {})
    end

    describe 'udev_log => err, config_file_replace => true' do
      it_behaves_like('udev_log_param', 'err', true, udev_log: 'err', config_file_replace: true)
    end

    describe 'udev_log => info, config_file_replace => true' do
      it_behaves_like('udev_log_param', 'info', true, udev_log: 'info', config_file_replace: true)
    end

    describe 'udev_log => debug, config_file_replace => true' do
      it_behaves_like('udev_log_param', 'debug', true, udev_log: 'debug', config_file_replace: true)
    end

    describe 'udev_log => err, config_file_replace => false' do
      it_behaves_like('udev_log_param', 'err', false, udev_log: 'err', config_file_replace: false)
    end

    describe 'udev_log => info, config_file_replace => false' do
      it_behaves_like('udev_log_param', 'info', false, udev_log: 'info', config_file_replace: false)
    end

    describe 'udev_log => debug, config_file_replace => false' do
      it_behaves_like('udev_log_param', 'debug', false, udev_log: 'debug', config_file_replace: false)
    end

    describe 'udev_log => invalid' do
      let(:params) { { udev_log: 'invalid' } }

      it 'fails' do
        expect {
          is_expected.to contain_class('udev')
        }.to raise_error(Puppet::Error, %r{does not match})
      end
    end

    describe 'config_file_replace => invalid' do
      let(:params) { { config_file_replace: 'invalid' } }

      it 'fails' do
        expect {
          is_expected.to contain_class('udev')
        }.to raise_error(Puppet::Error, %r{is not a boolean})
      end
    end

    describe 'rule parameter' do
      let(:params) { { 'rules' => { '99-foo.rules' => { 'content' => 'generic_rule' } } } }

      it {
        is_expected.to contain_file('/etc/udev/rules.d/99-foo.rules').with(owner: 'root',
                                                                           group: 'root',
                                                                           mode: '0644',
                                                                           content: 'generic_rule')
      }
    end
  end
end
