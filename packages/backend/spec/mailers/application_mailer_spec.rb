# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationMailer, type: :mailer do
  describe 'Mail' do
    it 'sends mail' do
      from = described_class.default[:from]
      expect(from).to eq('from@example.com')
    end
  end
end
