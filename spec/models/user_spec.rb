require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context "valid" do
      subject { build(:user) }
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    end

    context "invalid" do
      subject { described_class.new }
      it "is invalid without attributes" do
        expect(subject).not_to be_valid
      end

      it 'is invalid email' do
        subject.email = 'abd'
        subject.valid?
        expect(subject.errors[:email]).to have(1).items
      end

      it 'is invalid document' do
        subject.document = '123'
        subject.valid?
        expect(subject.errors[:document]).to have(1).items
      end

      it 'is invalid birthday_at' do
        subject.birthday_at = '0000-00-00'
        subject.valid?
        expect(subject.errors[:birthday_at]).to have_at_least(1).items
      end

      it 'is invalid photo' do
        subject.valid?
        expect(subject.errors[:photo]).to have_at_least(1).items
      end
    end


  end
end
