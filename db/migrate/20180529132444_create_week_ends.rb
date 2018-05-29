class CreateWeekEnds < ActiveRecord::Migration[5.2]
  def change
    create_table :week_ends do |t|
      t.date :start_date
      t.date :end_date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
