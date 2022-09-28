# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :events, dependent: :destroy
  validates :first_name, :email, :password, presence: true

  after_create :set_signup_date

  def set_signup_date
    return if signup_date.present?

    self.signup_date = Time.now
  end
end
