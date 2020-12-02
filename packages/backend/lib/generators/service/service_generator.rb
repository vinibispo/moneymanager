# frozen_string_literal: true

# Generator for generate services
class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)
  argument :params, type: :array, default: []
  # class_option :params, :type => :array, :default => [], :description => "Initialize variables"

  def generate_service
    template 'layout_service.erb', "app/services/#{name.underscore}_service.rb"
    p "You can call your service running: #{service_name}Service.new(params).perform"
  end

  private

  def service_name
    name.camelcase
  end
end
