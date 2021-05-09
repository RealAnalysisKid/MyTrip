class AddIsHiddenToCiites < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :is_hidden, :boolean, default: true
  end
end
