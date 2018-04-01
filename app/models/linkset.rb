class Linkset < ApplicationRecord
  acts_as_tenant
  belongs_to :campaign
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :destination_linksets, dependent: :destroy
  has_many :destinations, through: :destination_linksets
  accepts_nested_attributes_for :destinations, allow_destroy: true

  has_many :source_linksets, dependent: :destroy
  has_many :sources, through: :source_linksets
  accepts_nested_attributes_for :sources, allow_destroy: true

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

  def generate_atrributed_link(link)
    utms = []

    utms << ["utm_source", link.source.parameterize].join("=")
    utms << ["utm_medium", link.medium.parameterize].join("=")
    utms << ["utm_campaign", link.campaign.parameterize].join("=")

    tempLink = link.url.gsub(/(\&|\?)utm_[A-Za-z]+=[A-Za-z0-9]+/, "")
    tempParts = tempLink.split("#")

    if (tempParts[0].index("?") < 0 )
      tempParts[0] += "?" + utms.join("&") # The script adds UTM parameters to all links with the domain you've defined
    else
      tempParts[0] += "&" + utms.join("&")
    end

    attributedLink = tempParts.join("#")

    return attributedLink

  end


end
