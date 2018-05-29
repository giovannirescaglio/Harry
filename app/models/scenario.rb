class Scenario < ApplicationRecord
  belongs_to :destination
  belongs_to :user
end
