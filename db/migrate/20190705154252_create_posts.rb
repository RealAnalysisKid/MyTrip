class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.text  :address
      t.text    :reason
      t.text  :price
      t.text    :necessity
      t.text    :reservation
      t.text  :best_time
      t.boolean :is_hidden, default: true

      t.timestamps
    end
  end
end
