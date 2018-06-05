class User < ApplicationRecord
  # after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :moods
  has_many :guests
  has_many :projects, through: :guests
  has_many :scenarios
  mount_uploader :picture, PhotoUploader

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end

