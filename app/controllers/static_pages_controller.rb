class StaticPagesController < ApplicationController

  def home
    @data	= F1dataCall.season_standings
    @race_news = []
    url = 'https://www.f1technical.net/rss/news.xml'

    URI.open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      puts "Title: #{feed.channel.title}"
      feed.items.each do |item|
        @race_news << {
            title: "#{item.title}",
            link: "#{item.link}",
            pubDate: "#{item.pubDate}"
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
  end

  def about
    @next_race = F1dataCall.next_race
  end
end
