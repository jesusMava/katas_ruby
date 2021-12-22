class Tournament
  TABLE = "Team                           | MP |  W |  D |  L |  P"
  def self.tally(input)

    return TABLE+"\n" if input == "\n"

    hash = {}
    teams_and_result = input.split("\n")

    table_board = teams_and_result.each do |team|
      teams = team.split(';')
      result = teams.pop
      teams.each do |t| 
        if hash[t.to_sym]
          hash[t.to_sym][:MP] += 1
        else
          hash[t.to_sym] = { MP: 1, W:0, D: 0, L: 0, P: 0 }
        end
      end


      case result
      when 'win'
        hash[teams[0].to_sym][:W] += 1
        hash[teams[1].to_sym][:L] += 1
      when 'loss'
        hash[teams[1].to_sym][:W] += 1
        hash[teams[0].to_sym][:L] += 1
      when 'draw'
        hash[teams[1].to_sym][:D] += 1
        hash[teams[0].to_sym][:D] += 1
      end
    end
    hash.each do |key, value|
      hash[key][:P] = hash[key][:W] * 3 + hash[key][:D]
    end

    is_uniq = hash.map{ |e| e[1][:P] }
      hash = hash.sort_by{ |k,v| v[:P] }.reverse
      if is_uniq.uniq != is_uniq && hash.size > 2
      # hash.reverse!
      hash.sort!
    end
    res = ''
    hash.each do |el| 
      res += format("%-31s|  #{el[1][:MP]} |  #{el[1][:W]} |  #{el[1][:D]} |  #{el[1][:L]} |  #{el[1][:P]}\n", "#{el[0].to_s}")
    end 

     res = "#{TABLE}\n#{res}"
  end
end
