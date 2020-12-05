class Menu

  def start
    puts "Hello welcome to Seattle Criminal Database. Please input a number: "
    puts 'Type "search" to search for neighborhood in Seattle'
    puts 'Type "most" for neighborhood with the most amount of offenses'
    puts 'Type "least" for neighborhood with the least amount of offenses'
    user_input = STDIN.gets.chomp
    self.input(user_input)
  end

  def input(user_input)
    case user_input
    when "search"
      self.search
    when "most"
      self.amount
    when "least"
      self.neighborhood_least_crime
    when "4"
      puts "Hello"
    else
      exit
    end
  end

  def search
    puts "What neighborhood in Seattle would you like to find?"
    user_input = STDIN.gets.chomp
    self.find_neighborhood(user_input)
  end

  def find_neighborhood(user_input)
    Neighborhood.find_crime_count(user_input)
    puts 'Type "most" for neighborhood with the most amount of offenses'
    puts 'Type "least" for neighborhood with the least amount of offenses'
    puts "To exit, hit any key"
    user_input = STDIN.gets.chomp
    self.input(user_input)
    user_input = STDIN.gets.chomp
    self.input(user_input)
  end


  def amount
    puts "How many cities do you want to see? Please enter a number."
    user_input = STDIN.gets.chomp
    user_input.to_i
    self.neighborhood_most_crimes(user_input)
  end

  def neighborhood_most_crimes(user_input)
    Neighborhood.most_offenses
    puts 'Type "search" to search for neighborhood in Seattle'
    puts 'Type "least" for neighborhood with the least amount of offenses'
    puts "To exit, hit any key"
    user_input = STDIN.gets.chomp
    self.input(user_input)

  end

  def neighborhood_least_crime
    Neighborhood.least_offenses
    puts 'Type "search" to search for neighborhood in Seattle'
    puts 'Type "most" for neighborhood with the most amount of offenses'
    puts "To exit, hit any key"
    user_input = STDIN.gets.chomp
    self.input(user_input)
  end

end
