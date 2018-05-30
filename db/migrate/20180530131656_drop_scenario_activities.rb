class DropScenarioActivities < ActiveRecord::Migration[5.2]
  def change
    drop_table :scenario_activities
  end
end
