class Destination < ApplicationRecord
  belongs_to :project
  has_many :scenarios

end
