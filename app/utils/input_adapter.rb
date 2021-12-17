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

  def self.get_input_in_given_format(regex_format)
    input = gets.chomp()

    #TODO
    # if input.match(regex_format)
      return input
    # else
    #   puts "Please enter input in proper format"
    #   get_input_in_given_format(regex_format)
    # end
  end

end
