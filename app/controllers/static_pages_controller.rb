class StaticPagesController < ApplicationController

  def home
    @data = F1dataCall.api_call
  end

  def about
  end
end
