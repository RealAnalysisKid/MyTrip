class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|

      t.string  :address
      t.text    :reason
      t.string  :price
      t.text    :necessity
      t.text    :reservation
      t.string  :best_time
      t.boolean :is_hidden, default: true

      t.timestamps
    end
  end
end
