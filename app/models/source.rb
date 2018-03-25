class Source < ApplicationRecord
  acts_as_tenant
  validates_presence_of :name, :url, :medium
  has_many :source_linksets
  has_many :linksets, through: :source_linksets


end
