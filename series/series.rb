class Series
  attr_reader :serie
  def initialize(serie)
    @serie = serie
  end

  def slices(slice)
    resp = serie.split('')

    return resp if slice == 1

    return raise ArgumentError if slice > resp.length

    resp.each_cons(slice).to_a.map(&:join)
  end
end
