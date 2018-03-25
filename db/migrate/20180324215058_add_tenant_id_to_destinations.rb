class AddTenantIdToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_reference :destinations, :tenant, index: true
  end
end
