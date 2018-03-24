class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :key
      t.string :url

      t.timestamps
    end
  end
end
