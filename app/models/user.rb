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
  validate :photo_presence, on: :create

  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  enum :status, [ :active, :inactive ]

  protected
    def photo_presence
      pattern = %r{^(image)/(.)+$}
      unless photo.attached? && pattern.match?(photo.attachment.blob.content_type)
        errors.add(:photo, I18n.t("errors.messages.blank"))
      end
    end
end
