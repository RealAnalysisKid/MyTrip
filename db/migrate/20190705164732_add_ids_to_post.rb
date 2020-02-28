class AddIdsToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :user_id, :integer
    add_column :posts, :city_id, :integer
  end
end
