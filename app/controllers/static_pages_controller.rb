class StaticPagesController < ApplicationController
	layout false, only: [:channel]
  def contact
  end

  def channel
  end
end
