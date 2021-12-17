module InputHandler

  def self.get_integer_input(message)
    puts message
    return Integer(gets.chomp())
  end

  def self.get_input_as_array(message)
    puts message
    return gets.chomp().split(",").map(&:strip)
  end

  def self.get_input_in_given_format(regex_format)
    input = gets.chomp()

    if input =~ regex_format
      return input
    else
      raise ArgumentError, 'Unexpected input, Please give proper input.'
    end
  end

end
