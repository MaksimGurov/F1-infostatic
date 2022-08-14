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


  def self.next_race
    url = 'https://ergast.com/api/f1/current.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    season_progress = 1
    data["MRData"]['RaceTable']['Races'].each do |race|
      if Date.parse(race["date"]) < Date.today
        season_progress += 1
      end
    end
    next_race_data = "https://ergast.com/api/f1/2022/" + "#{season_progress}.json"
    uri = URI(next_race_data)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    next_race_info = []
    data["MRData"]['RaceTable']['Races'].each do |race|
      next_race_info << {
          raceName: "#{race["raceName"]}",
          raceDate: "#{race["date"]}",
          raceTime: "#{race["time"]}",
          raceFirstPracticeDate: "#{race["FirstPractice"]["date"]}",
          raceFirstPracticeTime: "#{race["FirstPractice"]["time"]}",
          raceSecondPracticeDate: "#{race["SecondPractice"]["date"]}",
          raceSecondPracticeTime: "#{race["SecondPractice"]["time"]}",
          raceThirdPracticeTime: "#{race["ThirdPractice"]["time"]}",
          raceThirdPracticeDate: "#{race["ThirdPractice"]["date"]}",
          raceQualifyingTime: "#{race["Qualifying"]["time"]}",
      }
    end
    next_race_info
  end



end  #class end