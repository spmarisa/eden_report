module InputAdapter

  def self.get_integer_input(message)
    puts message
    return Integer(gets.chomp())
    # raise ArgumentError, 'Unexpected input, Please give proper input.' if integer_input <= 0
  end

  def self.get_seq_input_as_array(message, size_of_array)
    puts message
    return size_of_array.times.map { gets.chomp() }
  end

end
