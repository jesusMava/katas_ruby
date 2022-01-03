class RunLengthEncoding
  def self.encode(input)
    return '' if input.empty?

    response = ''
    input.split('').chunk(&:itself).each do |el|
      if el[1].length == 1 
        response += "#{el[0]}"
      else
        response += "#{el[1].length}#{el[0]}"
      end
    end

    response
  end

  def self.decode(input)
    resp = ''

    letters = input.scan(/\d+\w|\d+\s+|\s|\w/)
    return input if letters.empty?

    letters.each do |el|
      amoun = el.scan(/\d+/)[0].to_i
      num = amoun == 0 ? 1 : amoun
      lett = el.scan(/[a-zA-Z]|\s/)[0]
      resp += lett * num
    end
    resp
  end
end
