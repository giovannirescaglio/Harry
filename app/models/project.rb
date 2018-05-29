class Project < ApplicationRecord
  belongs_to :user

  has_many :week_ends
end
