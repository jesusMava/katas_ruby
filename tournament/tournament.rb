# this is a copy of https://exercism.org/tracks/ruby/exercises/tournament/solutions/3zcurdia
module Tournament
  class Parser
    def self.parse(input)
      new.parse(input)
    end
    def parse(input)
      input.split("\n").map do |line|
        team_a, team_b, result = line.split(';')
        result = result.to_sym
        {
          team_a => result,
          team_b => inverse_result(result)
        }
      end
    end
    private
    def inverse_result(result)
      case result
      when :win
        :loss
      when :loss
        :win
      else
        :draw
      end
    end
  end
  class ScoreTable
    attr_reader :team, :win, :loss, :draw
    def self.build(matches)
      matches.each_with_object({}) do |match, output|
        match.each_key do |team|
          output[team] = ScoreTable.new(team) unless output.key?(team)
          output[team].add_match(match[team])
        end
      end.values
    end
    def initialize(team)
      @team = team
      @win = 0
      @loss = 0
      @draw = 0
    end
    def matches
      @matches ||= win + draw + loss
    end
    def add_match(result)
      case result
      when :win
        @win += 1
      when :draw
        @draw += 1
      when :loss
        @loss += 1
      end
    end
    def points
      @points ||= win * 3 + draw * 1
    end
    def to_a
      [team, matches, win, draw, loss, points]
    end
    def <=>(other)
      [-points, team] <=> [-other.points, other.team]
    end
  end
  class Report
    HEADER = %w[Team MP W D L P].freeze
    FORMAT = "%-31s| %2s | %2s | %2s | %2s | %2s\n"
    def self.generate(tally)
      tally.each_with_object(FORMAT % HEADER) do |score, acc|
        acc << FORMAT % score.to_a
      end
    end
  end
  def self.tally(input)
    input
      .then(&Parser.method(:parse))
      .then(&ScoreTable.method(:build))
      .sort
      .then(&Report.method(:generate))
  end
end
