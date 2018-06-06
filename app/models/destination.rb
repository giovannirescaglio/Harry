class Destination < ApplicationRecord
  belongs_to :project
  acts_as_votable
  validates :name, presence: true
  validates :name, uniqueness: { scope: :project}
end
