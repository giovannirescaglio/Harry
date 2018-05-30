class RemoveDescriptionFromDestinations < ActiveRecord::Migration[5.2]
  def change
        remove_column :destinations, :description
  end
end
