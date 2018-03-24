class DestinationLinkset < ApplicationRecord
  belongs_to :linkset
  belongs_to :destination
end
