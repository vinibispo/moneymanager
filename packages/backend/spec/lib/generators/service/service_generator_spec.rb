# frozen_string_literal: true

require 'generator_spec'
require 'generators/service/service_generator'
describe ServiceGenerator, type: :generator do
  let(:name) do
    FFaker::Color.name
  end

  destination File.expand_path('../tmp', __dir__)

  before do
    prepare_destination
    run_generator %W[#{name}]
  end

  after do
    run_generator %W[#{name}], behavior: :revoke
  end

  it 'creates a test initializer' do
    assert_file "app/services/#{name.underscore}_service.rb"
  end
end
