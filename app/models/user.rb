# frozen_string_literal: true

class User < ApplicationRecord
  has_one :address
  validates :name, :email, :document, :phone, :cns, :birthday_at, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_cpf_format_of :document
  validates :birthday_at, date: true
  validate :photo_presence, on: :create
  validates :address, presence: true
  validates_associated :address
  accepts_nested_attributes_for :address, allow_destroy: true

  has_one_attached :photo do |attachable|
    attachable.variant :medium, resize_to_limit: [200, 200]
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  enum :status, %i[inactive active]

  protected

  def photo_presence
    pattern = %r{^(image)/(.)+$}
    unless photo.attached? && pattern.match?(photo.attachment.blob.content_type)
      errors.add(:photo, I18n.t('errors.messages.blank'))
    end
  end
end
