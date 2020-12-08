class Menu

  def start
    puts "Hello welcome to Seattle Criminal Database. Please input a number: "
    puts 'Type "search" to search for neighborhood in Seattle'
    puts 'Type "most" for neighborhood with the most amount of offenses'
    puts 'Type "least" for neighborhood with the least amount of offenses'
    puts 'Type "list" for a list of all perpetrators'
    puts 'Type "perp" for perpetrator with the most amount of offenses'
    puts 'Type "crimes" for a list of crimes commited by the desired perpetrator'
    puts 'Type "month" to see the month with the most amount of crimes'
    puts 'To exit, push any key'
    user_input = STDIN.gets.chomp
    self.input(user_input)
  end

  def input(user_input)
    case user_input.upcase
    when "SEARCH"
      self.search
    when "MOST"
      self.neighborhood_most_crimes
    when "LEAST"
      self.neighborhood_least_crime
    when "PERP"
      puts self.perp_most
    when "CRIMES"
      self.list_perp_crimes
    when "LIST"
      self.list_perps
    when "MONTH"
      self.month
    else
      exit
    end
  end


  def find_neighborhood
    puts "What neighborhood in Seattle would you like to find?"
    user_input = STDIN.gets.chomp
    Neighborhood.find_crime_count(user_input)
    self.start
  end

  def neighborhood_most_crimes
    puts "How many cities do you want to see? Please enter a number."
    user_input = STDIN.gets.chomp
    user_input.to_i
    Neighborhood.most_offenses(user_input)
    self.start

  end

  def neighborhood_least_crime
    puts "How many cities do you want to see? Please enter a number."
    user_input = STDIN.gets.chomp
    user_input.to_i
    Neighborhood.least_offenses(user_input)
    self.start
  end

  def perp_most
    Perpetrator.most_offenses
    self.start
  end

  def list_perp_crimes
    puts "Please enter a name"
    user_input = STDIN.gets.chomp
    Perpetrator.list_of_offenses(user_input)
    self.start
  end

  def list_perps
    Perpetrator.list_of_perps
    self.start
  end

  def month
    Offense.dangerous_month
    self.start
  end
end
