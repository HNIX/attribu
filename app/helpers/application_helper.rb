module ApplicationHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
        class: "alert fade in alert-#{type} #{tag_class}"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"), type: "button", class: "close",
        "data-dismiss" => "alert")

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def tenant_name(tenant_id)
    Tenant.find(tenant_id).name
  end

  def s3_link(tenant_id, artifact_key)
    link_to artifact_key, "#{artifact_key}", class: "main-link", target: 'new'
  end

  def class_name_for_tenant_form(tenant)
    return "cc_form" if tenant.payment.blank?
    ""
  end

  def to_param(key, value)
    [key, field.parameterize].join("=")
  end


  def generate_atrributed_link(link)

   utmRegExp = /(\&|\?)utm_[A-Za-z]+=[A-Za-z0-9]+/

   utms = []

    utms << ["utm_campaign", link.linkset.campaign.title.parameterize].join("=")
    utms << ["utm_source", link.source_linkset.source.name.parameterize].join("=")
    utms << ["utm_medium", link.source_linkset.source.medium.parameterize].join("=")

    link = link.destination_linkset.destination.url.downcase.sub(utmRegExp, "")
    tempParts = link.split("#")

    if (!tempParts[0].index("?"))
      tempParts[0] += "?" + utms.join("&") # The script adds UTM parameters to all links with the domain you've defined
    else
      tempParts[0] += "&" + utms.join("&")
    end

    attributedLink = tempParts.join("#")

    return attributedLink
  end

  def count_destinations(linksets)
    dest_count = 0

    linksets.each do |linkset|
      dest_count = dest_count + linkset.destinations.count
    end

    return dest_count
  end

  def count_links(linksets)
    link_count = 0

    linksets.each do |linkset|
      link_count = link_count + linkset.links.count
    end

    return link_count
  end

  def count_sources(linksets)
    source_count = 0

    linksets.each do |linkset|
      source_count = source_count + linkset.sources.count
    end

    return source_count
  end

end
