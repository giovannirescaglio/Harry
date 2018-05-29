class Activity < ApplicationRecord
  belongs_to :project
  has_many :scenario_activities
end
