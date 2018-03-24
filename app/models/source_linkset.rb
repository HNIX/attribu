class SourceLinkset < ApplicationRecord
  belongs_to :linkset
  belongs_to :source
end
