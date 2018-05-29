class CreateScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :scenarios do |t|
      t.references :destination, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
