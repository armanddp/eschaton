#require File.expand_path(File.join(File.dirname(__FILE__),'..','test_helper.rb'))
require 'shoulda'
require 'generators/eschaton/map_generator'

class MapGeneratorTest < Test::Unit::TestCase
  
  def setup
    @destination = File.join('tmp', 'test_app')
    @source = Eschaton::MapGenerator.source_root

    Eschaton::MapGenerator.start('', :destination_root => @destination)
  end
  
  def test_install_map
    assert File.exists?(
      File.join(@destination, 'config', 'eschaton_google_api_keys.yml'))

    assert_equal(
      File.read(File.join(@source, 'eschaton_google_api_keys.yml')),
      File.read(File.join(@destination, 'config', 'eschaton_google_api_keys.yml')))
  end
  
  def teardown
    FileUtils.rm_rf(@destination)
  end
  
end