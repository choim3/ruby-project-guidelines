class Neighborhood < ActiveRecord::Base
  has_many :offenses
  has_many :perpetrators, through: :offenses

  def self.find_crime_count(neighborhood_name)
    result = GetRequester.parse_json
    puts "Number of crimes commited in city: " + result.find_all {|x| x["mcpp"] == neighborhood_name.upcase}.count.to_s
    puts "List of crimes commited: " + self.list_of_crimes(neighborhood_name).join(', ')
  end

  def self.most_offenses(amount)
    offense = Offense.group("neighborhood_name").order("count(neighborhood_name) DESC").limit(amount).to_a
    puts offense.map {|x| x.neighborhood_name}
  end

  def self.least_offenses(amount)
    offense = Offense.group("neighborhood_name").order("count(neighborhood_name) ASC").limit(amount).to_a
    puts offense.map {|x| x.neighborhood_name}
  end

  def self.list_of_crimes(string)
    array = []
    result = GetRequester.parse_json
    result.each do |x|
      if x["mcpp"] == string.upcase
        array << x["offense"]
      end
    end
    array.uniq
  end

  def self.perpetrators(name)
        offenses = Neighborhood.where(name: name)
        offenses.map do |s|
            Offense.where(neighborhood_id: s.id).map do |x|
                Perpetrator.where(id: x.perpetrator_id)
            end
        end
    end
end


    # def self.most_offense
    #   hash = Hash.new(0)
    #   result = GetRequester.parse_json
    #   result.each {|neighborhood| hash[neighborhood["mcpp"]] += 1}
    #   neighborhood_name = hash.max_by{|k, v| v}.first
    #   # self.list_of_crimes(neighborhood_name).join(', ')
    #   puts "Neighborhood Name: " + neighborhood_name
    #   puts "List of crimes commited: " + self.list_of_crimes(neighborhood_name).join(', ')
    # end

      #
      # def self.least_offenses
      #   hash = Hash.new(0)
      #   result = GetRequester.parse_json
      #   result.each {|neighborhood| hash[neighborhood["mcpp"]] += 1}
      #   neighborhood_name = hash.min_by{|k, v| v}.first
      #   # self.list_of_crimes(neighborhood_name).join(', ')
      #   puts "Neighborhood Name: " + neighborhood_name
      #   puts "List of crimes commited: " + self.list_of_crimes(neighborhood_name).join(', ')
      # end
