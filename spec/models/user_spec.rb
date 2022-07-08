# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  birthday_at :date             not null
#  cns         :string           not null
#  document    :string           not null
#  email       :string           not null
#  name        :string           not null
#  phone       :string           not null
#  status      :string           default(NULL), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }
  describe 'validations' do
    it "is valid with valid attributes" do
      subject.attributes = attributes_for(:user)
      expect(subject).to be_valid
    end

    context "invalid" do
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
    end


  end
end