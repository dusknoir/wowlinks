require 'spec_helper'

describe Wowlinks::Item do
  before :all do
    @item = Wowlinks::Item.new(41915)
  end

  it 'should properly set its type' do
    @item.type.should == 'item'
  end

  it 'should properly discern name, texture and quality' do
    @item.name.should == "Furious Gladiator's Satin Hood"
    @item.texture.should == 'inv_helmet_136'
    @item.quality.should == 'epic'
  end
end
