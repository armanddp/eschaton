require File.dirname(__FILE__) + '/test_helper'

class GoogleCoreExtTest < Test::Unit::TestCase
  
  def test_to_google_options
   assert_equal '{bounceGravity: 12, draggable: true, title: "My title!"}',
                 {:draggable => true, :bounce_gravity => 12, :title => "My title!"}.to_google_options

   assert_equal '{dragCrossMove: true, icon: local_icon}', 
                 {:drag_cross_move => true, :icon => :local_icon}.to_google_options

   assert_equal '{color: "red", opacity: 0.7, weight: 10}', 
                 {:color => 'red', :weight => 10, :opacity => 0.7}.to_google_options

   assert_equal '{color: "blue", offset: new GSize(10, 10)}',
                 {:color => 'blue', 
                  :offset => Google::OptionsHelper.to_google_size([10, 10])}.to_google_options(:dont_convert => [:offset])

   assert_equal '{color: "blue", zone: zz1}',
                 {:color => 'blue', :zone => 'zz1'}.to_google_options(:dont_convert => [:zone])
  end
  
end
