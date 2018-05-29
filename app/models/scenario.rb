class Scenario < ApplicationRecord
  belongs_to :destination
  belongs_to :user
  has_many :scenario_activities
end
