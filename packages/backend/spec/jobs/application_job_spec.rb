# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  it 'returns 1' do
    expect(described_class.perform_now).to eq(1)
  end
end
