require 'pry'



def get_first_name_of_season_winner(data, season)
  winner_hash = data[season].find do | person |
    person["status"] == "Winner"
  end 

  winner_hash["name"].split(" ")[0]
end

# => {"season 19"=>
#   [{"name"=>"Ashley Iaconetti",
#     "age"=>"26",
#     "hometown"=>"Great Falls, Virginia",
#     "occupation"=>"Nanny/Freelance Journalist",
#     "status"=>""},
#    {"name"=>"Becca Tilley",
#     "age"=>"26",
#     "hometown"=>"Shreveport, Louisiana[b]",
#     "occupation"=>"Chiropractic Assistant",
#     "status"=>""},


def get_contestant_name(data, occupation)
  data.keys.each do | season |
    worker = data[season].find do | contestant |
      contestant["occupation"] == occupation
    end

    if worker 
      return worker["name"]
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  residents = 0

  data.keys.each do | season |
    data[season].each do | contestant |
      #binding.pry
      if contestant["hometown"] == hometown
        residents += 1
      end
    end
  end

  residents
end

def get_occupation(data, hometown)
  data.keys.each do | season |
    data[season].each do | contestant |
      #binding.pry
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ages = []
  
  data[season].each do | contestant |
    ages << contestant["age"].to_f
  end
  
  (ages.sum / ages.length).round
end
