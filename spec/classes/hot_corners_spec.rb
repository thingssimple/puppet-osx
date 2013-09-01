require 'spec_helper'

describe 'osx::hot_corners' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  describe 'bottom left desktop' do
    let(:params) { {
      :corner => 'bottom left',
      :action => 'desktop',
    } }
    it 'should be tested' do
      should contain_boxen__osx_defaults("Set the bottom left hot corner to desktop").with({
        :user   => 'ilikebees',
        :key    => "wvous-bl-corner",
        :domain => 'com.apple.dock',
        :type   => 'int',
        :value  => 4,
      })

      should contain_boxen__osx_defaults("Set the modifier for the bottom left hot corner to false").with({
        :user   => 'ilikebees',
        :key    => "wvous-bl-modifier",
        :domain => 'com.apple.dock',
        :type   => 'int',
        :value  => 0,
      })
    end
  end
end
