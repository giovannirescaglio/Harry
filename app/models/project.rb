class Project < ApplicationRecord
  belongs_to :user

  has_many :week_ends
  has_many :moods
  has_many :guests
end
