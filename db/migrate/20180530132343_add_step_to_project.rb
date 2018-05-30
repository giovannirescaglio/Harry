class AddStepToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :step, :integer
  end
end
