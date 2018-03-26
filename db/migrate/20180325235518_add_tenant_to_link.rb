class AddTenantToLink < ActiveRecord::Migration[5.1]
  def change
    add_reference :links, :tenant, foreign_key: true
  end
end
