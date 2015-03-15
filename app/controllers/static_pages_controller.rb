class StaticPagesController < ApplicationController
	layout false, only: [:channel, :sitemap]
  def contact
  end

  # used by facebook
  def channel
  end

  def sitemap
  	require 'open-uri'
		@url_response = open('https://s3-us-west-2.amazonaws.com/sitemap-toukan/sitemaps/sitemap.xml.gz').read
  	#redirect_to "https://s3-us-west-2.amazonaws.com/sitemap-toukan/sitemaps/sitemap.xml.gz"
  end
end
