class Linkset < ApplicationRecord
  acts_as_tenant
  belongs_to :campaign
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :destination_linksets, dependent: :destroy
  has_many :destinations, through: :destination_linksets
  accepts_nested_attributes_for :destinations

  has_many :source_linksets, dependent: :destroy
  has_many :sources, through: :source_linksets
  accepts_nested_attributes_for :sources

  has_many :links, dependent: :destroy


  def destinations_attributes=(destination_attributes)
    destination_attributes.values.each do |destination_attribute|
      destination = Destination.find_or_create_by(destination_attribute)
      self.destinations << destination
    end
  end

  def sources_attributes=(source_attributes)
    source_attributes.values.each do |source_attribute|
      source = Source.find_or_create_by(source_attribute)
      self.sources << source
    end
  end
end
