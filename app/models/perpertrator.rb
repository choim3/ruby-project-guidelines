class Perpetrator < ActiveRecord::Base
  has_many :offenses
  has_many :neighborhoods, through: :offenses

  def self.most_offenses
       perp_ids = Offense.all.map { |x| x.perpetrator_id} #
       mostwanted = perp_ids.max_by { |x| perp_ids.count(x)}
       c = Perpetrator.where(id: mostwanted)
       puts c.map {|x| "#{x.name} Age: #{x.age} years old"}
  end

  def self.list_of_offenses(name)
       offenses = Perpetrator.where(name: name)
       list = offenses.map do |o|
           Offense.where(perpetrator_id: o.id).to_a
       end
       list.each do |o|
          puts o.map { |x| puts "#{x.type_of_offense} #{x.date} #{x.neighborhood_name}" }
       end
   end

   def self.list_of_perps
      puts Perpetrator.all.map { |x| x.name}.to_a
   end

end
