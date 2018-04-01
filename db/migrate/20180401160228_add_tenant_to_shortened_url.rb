class AddTenantToShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    add_reference :shortened_urls, :tenant, foreign_key: true
  end
end
