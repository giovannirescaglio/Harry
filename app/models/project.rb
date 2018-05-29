class Project < ApplicationRecord
  belongs_to :user


  has_many :moods
  has_one :user
  has_many :guests, dependent: :destroy
  has_many :week_ends, dependent: :destroy
  has_many :destinations
end
