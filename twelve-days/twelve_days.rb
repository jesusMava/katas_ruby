class TwelveDays
  DAY_WITH_PHRASE = {
    second: 'two Turtle Doves, and a Partridge in a Pear Tree.',
    third: 'three French Hens, ',
    fourth: 'four Calling Birds, ',
    fifth: 'five Gold Rings, ',
    sixth: 'six Geese-a-Laying, ',
    seventh: 'seven Swans-a-Swimming, ',
    eighth: 'eight Maids-a-Milking, ',
    ninth: 'nine Ladies Dancing, ',
    tenth: 'ten Lords-a-Leaping, ',
    eleventh: 'eleven Pipers Piping, ',
    twelfth: 'twelve Drummers Drumming, ',
  }

  def self.song
    gave_me = ''
    first_sentense = "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
    DAY_WITH_PHRASE.each do |day, phrase|
      gave_me = phrase + gave_me
      first_sentense += "\n\nOn the #{day} day of Christmas my true love gave to me: #{gave_me}"
    end

    first_sentense + "\n"
  end
end
