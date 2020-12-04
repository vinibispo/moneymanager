# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe 'ServiceGenerator', type: :generator do
  after do
    `rails d service api`
  end

  it 'creates a test initializer' do
    `rails g service api`
    command = `ls app/services`
    expect(command).to include('api_service.rb')
  end
end
