require 'spec_helper'

describe Wowlinks::Cache do
  it 'should default to ./.wowlinks-cache' do
    cache = Wowlinks::Cache.new
    cache.directory.should == File.expand_path('./.wowlinks-cache')
  end

  it 'should accept a custom directory' do
    test_dir = File.expand_path('./custom-wowlinks-directory')

    cache = Wowlinks::Cache.new(test_dir)
    cache.directory.should == test_dir

    Dir.rmdir(test_dir) rescue true
  end

  it 'should save files and data' do
    cache = Wowlinks::Cache.new
    cache.write('testfile', 'testdata')
  end

  it 'should read files and data' do
    cache = Wowlinks::Cache.new
    cache.read('testfile').should == 'testdata'
  end

  it 'should accept a maximum time in seconds for cache invalidation' do
    cache = Wowlinks::Cache.new
    cache.read('testfile', 0).should be_nil
  end

  it 'should delete files' do
    cache = Wowlinks::Cache.new
    cache.delete('testfile')
  end
end
