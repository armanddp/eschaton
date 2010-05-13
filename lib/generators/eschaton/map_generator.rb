require 'rails/generators'
module Eschaton
  class MapGenerator < Rails::Generators::Base
    argument :slice_class
     
    def self.source_root
      File.join(File.dirname(__FILE__), 'templates')
    end

    def create_config
      # Config file
      copy_file "eschaton_google_api_keys.yml", "config/eschaton_google_api_keys.yml"
    end
    
    def create_javascript
      # Javascript
      copy_file "jquery.js", "public/javascripts/jquery.js"
      copy_file "eschaton.js", "public/javascripts/eschaton.js"      

      copy_file "map_controller.rb", "app/controllers/map_controller.rb"
      copy_file "map_helper.rb", "app/helpers/map_helper.rb"

      empty_directory "app/views/map"
      copy_file "map.erb", "app/views/layouts/map.html.erb"
      copy_file "index.erb", "app/views/map/index.html.erb"
    end
    
    def create_marker_icons
      # Marker icons
      copy_file "blue.png", "public/images/blue.png"
      copy_file "red.png", "public/images/red.png"
      copy_file "yellow.png", "public/images/yellow.png"
      copy_file "green.png", "public/images/green.png"      
      copy_file "shadow.png", "public/images/shadow.png"
    end
    
    def create_slice
      # Eschaton slice
      slice_name = File.basename(Rails.root).singularize.downcase
      @slice_class = slice_name.classify
      slice_dir = "lib/eschaton_slices/#{slice_name}"

      empty_directory slice_dir

      template "generator_ext.rb", "#{slice_dir}/#{slice_name}_generator_ext.rb" 
      template "view_ext.rb", "#{slice_dir}/#{slice_name}_view_ext.rb"
    end
    

  end
end