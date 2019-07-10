class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|

      t.string :title
      t.text   :description

      t.timestamps
    end
  end
end
