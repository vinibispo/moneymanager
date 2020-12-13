# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SignUpJob, type: :job do
  let(:user) { create(:user) }

  describe '#perform_later' do
    it 'sends a email' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        described_class.perform_later(user.id)
      end.to have_enqueued_job
    end
  end

  describe '#perform_now' do
    it 'returns id of user' do
      expect(described_class.perform_now(user.id)).to eq(user.id)
    end
  end
end
