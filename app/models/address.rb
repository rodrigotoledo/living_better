class Address < ApplicationRecord
  belongs_to :user
  validates :street, :zipcode, :neighborhood, :city, :state, presence: true
end
