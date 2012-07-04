require 'spec_helper'

describe Wowlinks::Spell do
  before :all do
    @spell = Wowlinks::Spell.new(34433)
  end

  it 'should properly set its type' do
    @spell.type.should == 'spell'
  end

  it 'should properly discern name and texture' do
    @spell.name.should == 'Shadowfiend'
    @spell.texture.should == 'spell_shadow_shadowfiend'
  end

  it 'should always set quality to spell' do
    @spell.quality.should == 'spell'
  end
end
