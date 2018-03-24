class CreateSourceLinksets < ActiveRecord::Migration[5.1]
  def change
    create_table :source_linksets do |t|
      t.belongs_to :linkset, foreign_key: true
      t.belongs_to :source, foreign_key: true

      t.timestamps
    end
  end
end
