class CreateScenarioActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :scenario_activities do |t|
      t.references :scenario, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
