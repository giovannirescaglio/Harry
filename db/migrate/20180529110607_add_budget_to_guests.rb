class AddBudgetToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :budget, :integer
  end
end
