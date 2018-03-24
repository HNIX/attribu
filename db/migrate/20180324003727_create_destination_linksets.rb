class CreateDestinationLinksets < ActiveRecord::Migration[5.1]
  def change
    create_table :destination_linksets do |t|
      t.belongs_to :linkset, foreign_key: true
      t.belongs_to :destination, foreign_key: true

      t.timestamps
    end
  end
end
