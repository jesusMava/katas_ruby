class Hamming
  def self.compute(arg1, arg2)
    sum = 0
    return 0 if arg1 == arg2

    raise ArgumentError if arg1.length != arg2.length

    arg1.length.times do |ind|
      sum += 1 if arg1[ind] != arg2[ind]
    end

    sum 
  end
end
