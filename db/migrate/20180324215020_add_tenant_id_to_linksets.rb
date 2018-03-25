class AddTenantIdToLinksets < ActiveRecord::Migration[5.1]
  def change
    add_reference :linksets, :tenant, index: true
  end
end
