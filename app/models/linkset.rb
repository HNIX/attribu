class Linkset < ApplicationRecord
  belongs_to :campaign

  has_many :destination_linksets
  has_many :destinations, through: :destination_linksets

  has_many :source_linksets
  has_many :sources, through: :source_linksets


  validates_presence_of :name
  validates_uniqueness_of :name
end
