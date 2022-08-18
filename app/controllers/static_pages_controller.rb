class StaticPagesController < ApplicationController

  def home
    @data	= F1dataCall.season_standings
  end

  def full_standings
    @data	= F1dataCall.season_standings
  end

  def news
    @race_news = []
    url = 'https://www.f1news.ru/export/news.xml'
      URI.open(url) do |rss|
        feed = RSS::Parser.parse(rss, do_validate=false)
        "Title: #{feed.channel.title}"
        feed.items.each do |item|
          @race_news << {
              title: "#{item.title}",
              link: "#{item.link}",
              pubDate: "#{item.pubDate}",
              imageLink: "#{item.enclosure.url}",
              description: "#{item.description}"
          }
        end
    end

    @race_news
  end

  def constructors
    @constructor_data = F1dataCall.constructor_standings
  end

  def race_results
    @race_results = F1dataCall.race_results(params[:id])
  end

  def calendar
    @data = F1dataCall.api_call
    @raceprogress = @data[3]
    @finished_races = []
    @upcoming_races = []
    @data.each do |race|
      if race[:raceStatus] == "Finished"
        @finished_races << race
      else
        @upcoming_races << race
      end
    end
    @finished_races
  end

  def historical_data
    if params[:date] == nil
      @year = params[:year]
      @data = F1dataCall.historical_drivers_standings(@year)
      @constructor_data = F1dataCall.historical_constructor_standings(@year)
    else
      @year = params[:date][:year]
      @data = F1dataCall.historical_drivers_standings(@year)
      @constructor_data = F1dataCall.historical_constructor_standings(@year)
    end
  end

  def driver_bio
    @driver	= params[:driver]
  end

  def about
    @next_race = F1dataCall.next_race
  end
end
