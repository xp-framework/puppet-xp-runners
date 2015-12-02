require 'spec_helper'
describe 'xp_runners' do

  context 'with defaults for all parameters' do
    it { should contain_class('xp_runners') }
  end
end
