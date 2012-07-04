require 'spec_helper'

describe Wowlinks::Thing do
  before :all do
    @thing = Wowlinks::Thing.new(41995)
  end

  it 'should take an ID' do
    thing = Wowlinks::Thing.new(41995)
  end

  it 'should derive a cache key based on its type and id' do
    @thing.key.should =~ /#{@thing.type}#{@thing.id}/
  end

  it 'should provide id, name, quality and icon readers' do
    expect { @thing.id; @thing.name; @thing.texture; @thing.quality }.not_to raise_error
  end

  it 'should never overwrite name, quality and icon' do
    @thing.name.should == "[#{@thing.type.capitalize} #{@thing.id}]"
    @thing.texture.should == 'inv_misc_questionmark'
    @thing.quality.should == 'error'
  end

  it 'should render a link' do
    @thing.to_html.should =~ %r(<a(.+)>(.+)</a>)
  end
end
