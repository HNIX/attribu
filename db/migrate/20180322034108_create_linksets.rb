class CreateLinksets < ActiveRecord::Migration[5.1]
  def change
    create_table :linksets do |t|
      t.string :name
      t.belongs_to :campaign, foreign_key: true

      t.timestamps
    end
  end
end
