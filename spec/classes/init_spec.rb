require 'spec_helper'
describe 'xp_runners' do

  # Pretend we are Debian, for some reasons this doesn't work even though
  # lsb-release is available
  let (:facts) { { :osfamily => 'Debian', :lsbdistid => 'debian' } }

  context 'with defaults for all parameters' do
    it { should contain_class('xp_runners') }
  end
end
