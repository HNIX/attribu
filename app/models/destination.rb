class Destination < ApplicationRecord
  validates_presence_of :name, :url
  validates_uniqueness_of :name, :url

  has_many :destination_linksets
  has_many :linksets, through: :destination_linksets


end
