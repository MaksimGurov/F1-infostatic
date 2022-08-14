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


end