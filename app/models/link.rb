class Link < ApplicationRecord
  acts_as_tenant
  belongs_to :linkset
  belongs_to :destination_linkset
  belongs_to :source_linkset
  has_shortened_urls
end
