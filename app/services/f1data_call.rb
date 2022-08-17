class F1dataCall


  require 'date'

  def self.api_call
    url = 'https://ergast.com/api/f1/current.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    @season_data = []
    season_progress = 0
    race_id = 0
    data["MRData"]['RaceTable']['Races'].each do |race|
      @season_data << {
          raceID: race_id +=1,
          raceName: "#{race["raceName"]}",
          raceDate: "#{race["date"]}",
          raceLocation: "#{race["Circuit"]["Location"]["locality"]}",
          raceCountry: "#{race["Circuit"]["Location"]["country"]}",
          raceStatus: (Date.parse(race["date"]) < Date.today ? "Finished" : nil),
          raceURL: "#{race["url"]}"
      }

      if Date.parse(race["date"]) < Date.today
        season_progress += 1
      end
        #@season_data << {PassedRaces: "#{season_progress}"}
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
    key = ENV["WEATHER_API"]
    id_counter = 0
    data["MRData"]['RaceTable']['Races'].each do |race|
      next_race_info << {
          raceCountry: "#{race["Circuit"]["Location"]["country"]}",
          raceName: "#{race["raceName"]}",
          raceDate: "#{race["date"]}",
          raceTime: "#{race["time"].to_time.in_time_zone("Pacific Time (US & Canada)")}",
          raceFirstPracticeDate: "#{race["FirstPractice"]["date"]}",
          raceFirstPracticeTime: "#{race["FirstPractice"]["time"].to_time.in_time_zone("Pacific Time (US & Canada)")}",
          raceSecondPracticeDate: "#{race["SecondPractice"]["date"]}",
          raceSecondPracticeTime: "#{race["SecondPractice"]["time"].to_time.in_time_zone("Pacific Time (US & Canada)")}",
          raceThirdPracticeTime: "#{race["ThirdPractice"]["time"].to_time.in_time_zone("Pacific Time (US & Canada)")}",
          raceThirdPracticeDate: "#{race["ThirdPractice"]["date"]}",
          raceQualifyingTime: "#{race["Qualifying"]["time"].to_time.in_time_zone("Pacific Time (US & Canada)")}",
      }
      city = race["Circuit"]["Location"]['locality']
      weather_info = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{key}&units=imperial"
      uri = URI(weather_info)
      response = Net::HTTP.get(uri)
        weather_parsed = JSON.parse(response)
      next_race_info.append(
          #  raceWeatherDiscription: "#{weather_parsed['weather'][0]['description']}",
          #  raceWeatherTemp: "#{weather_parsed['main']['temp']}"
      )
    end
    next_race_info
  end



  def self.season_standings

    url = 'http://ergast.com/api/f1/current/driverStandings.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    season_standings_data = []
    parsed_data = data['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']
    parsed_data.each do |driver|
      driver
      season_standings_data << {
          driverPosition: "#{driver['position']}",
          driverFirstName: "#{driver['Driver']['givenName']}",
          driverLastName: "#{driver['Driver']['familyName']}",
          driverCode: "#{driver['Driver']['code']}",
          driverPoints: "#{driver['points']}",
          driverURL: "#{driver['Driver']['url']}",
          driverConstructor: "#{driver['Constructors'][0]['name']}",
          driverNationality: "#{driver['Driver']['nationality']}"
      }

    end


      season_standings_data

  end


  def self.constructor_standings

    url = "http://ergast.com/api/f1/current/constructorStandings.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    constructor_standings_data = []
    parsed_data = data['MRData']['StandingsTable']['StandingsLists'][0]['ConstructorStandings']
    parsed_data.each do |constructor|
      constructor_standings_data << {
          constructorPosition: "#{constructor['position']}",
          constructorPoints: "#{constructor['points']}",
          constructorWins: "#{constructor['wins']}",
          constructorName:"#{constructor['Constructor']['name']}"
      }
    end
     constructor_standings_data
  end


  def self.race_results(race_id)
    url = "https://ergast.com/api/f1/2022/#{race_id}/results.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    race_results_data = []
    parsed_data = data['MRData']['RaceTable']['Races'][0]['Results'].each do |result|
      race_results_data << {
          position: "#{result["position"]}",
          driverFirstName: "#{result['Driver']['givenName']}",
          driverLastName: "#{result['Driver']['familyName']}",
          constructor: "#{result['Constructor']['name']}",
          status: "#{result['status']}",
          # time: "#{result['time']['time]']}"
          time: result['Time']
      }
    end
     race_results_data

  end


  def self.historical_drivers_standings(year)

    url = "https://ergast.com/api/f1/#{year}/driverStandings.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    season_standings_data = []
    parsed_data = data['MRData']['StandingsTable']['StandingsLists'][0]['DriverStandings']
    parsed_data.each do |driver|
      driver
      season_standings_data << {
          driverPosition: "#{driver['position']}",
          driverFirstName: "#{driver['Driver']['givenName']}",
          driverLastName: "#{driver['Driver']['familyName']}",
          driverCode: "#{driver['Driver']['code']}",
          driverPoints: "#{driver['points']}",
          driverURL: "#{driver['Driver']['url']}",
          driverConstructor: "#{driver['Constructors'][0]['name']}",
          driverNationality: "#{driver['Driver']['nationality']}"

      }

    end


    season_standings_data

  end


  def self.historical_constructor_standings(year)

    url = "http://ergast.com/api/f1/#{year}/constructorStandings.json"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    constructor_standings_data = []
    parsed_data = data['MRData']['StandingsTable']['StandingsLists'][0]['ConstructorStandings']
    parsed_data.each do |constructor|
      constructor_standings_data << {
          constructorPosition: "#{constructor['position']}",
          constructorPoints: "#{constructor['points']}",
          constructorWins: "#{constructor['wins']}",
          constructorName:"#{constructor['Constructor']['name']}"
      }
    end
    constructor_standings_data
  end



end  #class end