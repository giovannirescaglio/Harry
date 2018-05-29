class CreateMoods < ActiveRecord::Migration[5.2]
  def change
    create_table :moods do |t|
      t.boolean :wild, null: false, default: false
      t.boolean :city, null: false, default: false
      t.boolean :fancy, null: false, default: false
      t.boolean :trashy, null: false, default: false
      t.boolean :clubbing, null: false, default: false
      t.boolean :chilling, null: false, default: false
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
