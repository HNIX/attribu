class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :domain
      t.string :source
      t.string :campaign
      t.string :medium
      t.belongs_to :linkset, foreign_key: true
      t.belongs_to :destination_linkset, foreign_key: true
      t.belongs_to :source_linkset, foreign_key: true

      t.timestamps
    end
  end
end
