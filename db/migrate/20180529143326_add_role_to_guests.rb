class AddRoleToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :role, :string
  end
end
