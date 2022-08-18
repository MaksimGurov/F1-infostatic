module StaticPagesHelper
  require "uri"
  require 'nokogiri'
  require 'open-uri'
  require "i18n"
  require 'json'
  require 'wikipedia'

  def circuit_info(racename)
    page = Wikipedia.find( racename, :tllimit => 500 )
    page.summary
  end


  def pie_chart(constructor_data)

    scores = []
    @constructor_data.each do |constructor|
      scores << constructor[:constructorPoints].to_i


    end
    p	scores
  end


  def car_image(constructor)
    html = ''
    case constructor
    when  "Ferrari"
      html += image_tag "Ferrari.png"
    when "AlphaTauri"
      html += image_tag "Alpha.png"
    when "Red Bull"
      html += image_tag "RedBull.png"
    when "McLaren"
      html += image_tag "Maclaren.png"
    when "Mercedes"
      html += image_tag "Mercedez.png"
    when "Williams"
      html += image_tag "Williams.png"
    when "Alpine F1 Team"
      html += image_tag "Alpine.png"
    when "Aston Martin"
      html += image_tag "AstonMartin.png"
    when "Alfa Romeo"
      html += image_tag "AlfaRome.png"
    when "Haas F1 Team"
      html += image_tag "Hass.png"
    end
    html.html_safe
  end

  def location_flag(country)
    html = ''
    p country
    case country
    when "USA"
      flag_icon(:us, element: :div)
    when "UK"
      flag_icon(:gb, element: :div)
    when "Italy"
      flag_icon(:it, element: :div)
    when "Australia"
      flag_icon(:au, element: :div)
    when "Spain"
      flag_icon(:es, element: :div)
    when "Monaco"
      flag_icon(:mc, element: :div)
    when "Mexico"
      flag_icon(:mx, element: :div)
    when "Austria"
      flag_icon(:at, element: :div)
    when "Japan"
      flag_icon(:jp, element: :div)
    when "Saudi Arabia"
      flag_icon(:sa, element: :div)
    when "Belgium"
      flag_icon(:be, element: :div)
    when "Bahrain"
      flag_icon(:bh, element: :div)
    when "UAE"
      flag_icon(:ae, element: :div)
    when "Singapore"
      flag_icon(:sg, element: :div)
    when "Netherlands"
      flag_icon(:nl, element: :div)
    when "France"
      flag_icon(:fr, element: :div)
    when "Hungary"
      flag_icon(:hu, element: :div)
    when "Canada"
      flag_icon(:ca, element: :div)
    when "Brazil"
      flag_icon(:br, element: :div)
    when "Azerbaijan"
      flag_icon(:az, element: :div)
    when "British"
      flag_icon(:gb, element: :div)
    when "Mexican"
      flag_icon(:mx, element: :div)
    when "Spanish"
      flag_icon(:es, element: :div)
    when "Dutch"
      flag_icon(:nl, element: :div)
    when "French"
      flag_icon(:fr, element: :div)
    when "Monegasque"
      flag_icon(:mc, element: :div)
    when "Finnish"
      flag_icon(:fi, element: :div)
    when "Japanese"
      flag_icon(:jp, element: :div)
    when "Australian"
      flag_icon(:au, element: :div)
    when "Canadian"
      flag_icon(:ca, element: :div)
    when "German"
      flag_icon(:de, element: :div)
    when "Thai"
      flag_icon(:th, element: :div)
    when "Chinese"
      flag_icon(:cn, element: :div)
    when "Danish"
      flag_icon(:dk, element: :div)
    when "Brazilian"
      flag_icon(:br, element: :div)
    when "Indian"
      flag_icon(:in, element: :div)
    when "Italian"
      flag_icon(:it, element: :div)
    when "Argentine"
      flag_icon(:ar, element: :div)
    when "Austrian"
      flag_icon(:at, element: :div)
    end


  end


end