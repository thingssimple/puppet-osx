require 'spec_helper'

describe 'osx::system::verbose_boot' do
  describe('enabled') do
    let(:params) { {:ensure => 'present'} }
    it 'should set the value to "-v"' do
      should contain_exec('Set Verbose Boot NVRAM Flag').with({
        :command => "nvram boot-args='-v'",
        :unless  => "nvram boot-args | awk -F'\t' '{ print \$2 }' | grep '^-v$'",
        :user    => 'root',
      })
    end
  end

  describe('disabled') do
    let(:params) { {:ensure => 'absent'} }
    it 'should set the value to ""' do
      should contain_exec('Remove Verbose Boot NVRAM Flag').with({
        :command => 'nvram boot-args=',
        :onlyif  => "nvram boot-args | awk -F'\t' '{ print \$2 }' | grep '^-v$'",
        :user    => 'root',
      })
    end
  end


end
