class F1dataCall



  require 'date'

  def self.api_call
    url = 'https://ergast.com/api/f1/current.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    @season_data = []
    season_progress = 0
    data["MRData"]['RaceTable']['Races'].each do |race|
      @season_data << {
          raceName: "#{race["raceName"]}",
          raceDate: "#{race["date"]}",
          raceLocation: "#{race["Circuit"]["Location"]["locality"]}",
          raceStatus: (Date.parse(race["date"]) < Date.today ? "Finished" : nil),
          raceURL: "#{race["url"]}"
      }

      if Date.parse(race["date"]) < Date.today
        season_progress += 1
      end
      @season_data << {PassedRaces: "#{season_progress}"}
    end
    @season_data
  end



end  #class end