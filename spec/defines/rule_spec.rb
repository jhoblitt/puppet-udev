require 'spec_helper'

describe 'udev::rule', :type => :define do

  shared_examples 'generic_rule' do |title, state, params|
    let(:title)  { title }
    let(:params) { params }

    it do
      should contain_class('udev')
      should contain_file("/etc/udev/rules.d/#{title}").with({
        :ensure  => state,
        :owner   => 'root',
        :group   => 'root',
        :mode    => '0644',
        :source  => params[:source],
        :content => params[:content],
        # XXX figure out how to properly test metaparams...
        #:notify => 'Class[Udev::Udevadm]{:name=>"Udev::Udevadm"}',
      })
    end
  end


  describe 'for osfamily RedHat' do
    let :facts do
      {
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '6',
      }
    end

    describe 'content => foo' do
      it_behaves_like(
        'generic_rule',
        '99-foo.rules',
        'present',
        { :content => 'foo' }
      )
    end

    describe 'ensure => present, content => foo' do
      it_behaves_like(
        'generic_rule',
        '99-foo.rules',
        'present',
        { :ensure => 'present', :content => 'foo' }
      )
    end

    describe 'source => foo' do
      it_behaves_like(
        'generic_rule',
        '99-foo.rules',
        'present',
        { :source => 'foo' }
      )
    end

    describe 'ensure => present, source => foo' do
      it_behaves_like(
        'generic_rule',
        '99-foo.rules',
        'present',
        { :ensure => 'present', :source => 'foo' }
      )
    end

    describe 'ensure => absent' do
      it_behaves_like(
        'generic_rule',
        '99-foo.rules',
        'absent',
        {
          :ensure  => 'absent',
        }
      )
    end

    describe 'no params' do
      let(:title) { '99-foo.rules' }

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /parameter \$source or \$content is required/)
      end
    end

    describe 'content => foo, source => foo' do
      let(:title) { '99-foo.rules' }
      let :params do
        {
          :content => 'foo',
          :source  => 'foo',
        }
      end

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /parameters \$source and \$content are mutually exclusive/)
      end
    end

    describe 'ensure => absent, content => foo, source => foo' do
      let(:title) { '99-foo.rules' }
      let :params do
        {
          :ensure  => 'absent',
          :content => 'foo',
          :source  => 'foo',
        }
      end

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /parameters \$source and \$content are mutually exclusive/)
      end
    end

    describe 'ensure => invalid' do
      let(:title) { '99-foo.rules' }
      let(:params) {{ :ensure => 'invalid' }}

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /does not match/)
      end
    end

    describe 'content => true' do
      let(:title) { '99-foo.rules' }
      let(:params) {{ :content => true }}

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /is not a string/)
      end
    end

    describe 'source => true' do
      let(:title) { '99-foo.rules' }
      let(:params) {{ :source => true }}

      it 'should fail' do
        expect {
          should contain_class('udev')
        }.to raise_error(Puppet::Error, /is not a string/)
      end
    end

  end
end
