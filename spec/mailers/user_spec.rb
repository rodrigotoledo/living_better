require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "information_updated" do
    let(:user) { create(:user, phone: Rails.application.credentials.config[:sms_phone_number]) }
    let(:mail) { described_class.information_updated(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Informções atualizadas")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(user.email)
    end
  end

end
