class Source < ApplicationRecord
  validates_presence_of :name, :url, :medium
  has_many :source_linksets
  has_many :linksets, through: :source_linksets


end
