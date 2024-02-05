# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  before_validation :set_username
  validate :email_or_phone_number_present?
  validates :email, uniqueness: true, if: -> { email.present? }
  validates :phone_number, uniqueness: true, if: -> { phone_number.present? }

  enum gender: %i[Male Female Other]

  def set_username
    return if username.present?

    self.username = email.present? ? email[0..(email.index('@') - 1)] : phone_number
  end

  def email_or_phone_number_present?
    return if email.present? || phone_number.present?

    errors.add(:phone_number, 'Email must present')
    errors.add(:email, 'Phone must present')
  end

  def name
    [first_name, last_name].join(' ')
  end

  def self.find_for_database_authentication(conditions = {})
    sign_in_key = conditions[:username].downcase
    find_by('lower(username) = ? OR lower(email) = ? OR phone_number = ?', sign_in_key, sign_in_key, sign_in_key)
  end
end
