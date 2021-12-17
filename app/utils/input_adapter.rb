module InputAdapter

  def self.get_integer_input(message)
    puts message
    return Integer(gets.chomp())
    # raise ArgumentError, 'Unexpected input, Please give proper input.' if integer_input <= 0
  end

  def self.get_input_as_array(message)
    puts message
    return gets.chomp().split(",").map(&:strip)
  end

end
