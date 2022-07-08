# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validations' do
    context 'valid' do
      subject { build(:address, user: build(:user)) }

      it 'is valid with valid attributes' do
        expect(subject).to be_valid
      end
    end

    context 'invalid' do
      subject { described_class.new }

      it 'is invalid without attributes' do
        expect(subject).not_to be_valid
        expect(subject.errors[:user]).to have(1).items
        expect(subject.errors[:street]).to have(1).items
        expect(subject.errors[:zipcode]).to have(1).items
        expect(subject.errors[:neighborhood]).to have(1).items
        expect(subject.errors[:city]).to have(1).items
        expect(subject.errors[:state]).to have(1).items
      end
    end
  end
end
