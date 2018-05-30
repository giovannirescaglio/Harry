class DropScenarios < ActiveRecord::Migration[5.2]
  def change
    drop_table :scenarios
  end
end
