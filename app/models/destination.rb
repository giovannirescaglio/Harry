class Destination < ApplicationRecord
  belongs_to :project
  acts_as_votable
end
