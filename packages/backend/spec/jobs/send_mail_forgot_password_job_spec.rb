# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendMailForgotPasswordJob, type: :job do
  before do
    ActiveJob::Base.queue_adapter = :test
  end

  let(:user) { create(:user) }

  describe '#perform_later' do
    it 'sends a email' do
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
