class AddTenantIdToSources < ActiveRecord::Migration[5.1]
  def change
    add_reference :sources, :tenant, index: true
  end
end
