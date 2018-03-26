class SourceLinkset < ApplicationRecord
  belongs_to :linkset
  belongs_to :source

  has_many :links, dependent: :destroy
end
