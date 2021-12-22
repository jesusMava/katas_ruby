class Matrix
  def initialize(matrix)
    @matrix = matrix.split("\n").map { |e| e.split(' ').map(&:to_i) }
  end

  def rows
    matrix
  end

  def columns
    matrix.transpose
  end

  private

  attr_reader :matrix
end
