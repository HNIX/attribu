module CampaignsHelper


  def count_links(linksets)
    link_count = 0

    linksets.each do |linkset|
      link_count = link_count + linkset.links.count
    end

    return link_count
  end

  def count_destinations(linksets)
    dest_count = 0

    linksets.each do |linkset|
      dest_count = dest_count + linkset.destinations.count
    end

    return dest_count
  end

end
