class DestinationLinkset < ApplicationRecord
  belongs_to :linkset
  belongs_to :destination

  has_many :links, dependent: :destroy
end
