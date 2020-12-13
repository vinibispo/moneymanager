# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'signup' do
    let(:user) do
      create(:user)
    end
    let(:mail) { described_class.signup user.id }

    it 'renders the headers' do
      expect(mail.subject).to eq('Signup')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Bem vindo #{user.name}")
    end
  end

  describe 'forgot_password' do
    let(:mail) { described_class.forgot_password }

    it 'renders the headers' do
      expect(mail.subject).to eq('Forgot password')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
