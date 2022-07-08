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
class User < ApplicationRecord
  validates :name, :email, :document, :phone, :cns, :birthday_at, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_cpf_format_of :document
  validates :birthday_at, date: true

  enum :status, [ :active, :inactive ]
end
