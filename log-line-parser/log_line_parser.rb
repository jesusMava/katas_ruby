class LogLineParser
  def initialize(line)
    @line = line
    @level = ''
    @message = ''
  end

  def message
    split_array
    @message
  end

  def log_level
    split_array
    @level
  end

  def reformat
    split_array
    "#{@message} (#{@level})"
  end

  def split_array
    separate_array = @line.split(':')

    @level = separate_array[0].gsub(/[\[\]]/,'').strip.downcase
    @message = separate_array[1].strip
  end
end
