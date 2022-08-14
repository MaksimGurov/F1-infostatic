class StaticPagesController < ApplicationController

  def home
    @data = F1dataCall.api_call
  end

  def about
    @next_race = F1dataCall.next_race
  end
end
