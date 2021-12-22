
class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    arr_num = [first_operand, second_operand]
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    return "Division by zero is not allowed." if second_operand == 0 && operation == '/'
    there_is_string = arr_num.any? { |elem| elem.class == String }
    raise ArgumentError if there_is_string

    result = first_operand.public_send(operation.to_sym, second_operand)

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
