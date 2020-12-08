class Offense < ActiveRecord::Base
  belongs_to :perpetrator
  belongs_to :neighborhood

  def self.dangerous_month
       datetime = Offense.all.map { |x| x.date }.join(" ")
       date = datetime.split("-")
       s = date.max_by { |x| date.count(x) }
       if s == "01"
           puts "January had the most crimes with #{date.count(s)}"
       elsif s == "02"
           puts "February had the most crimes with #{date.count(s)}"
       elsif s == "03"
           puts "March had the most crimes with #{date.count(s)}"
       elsif s == "04"
           puts "putsril had the most crimes with #{date.count(s)}"
       elsif s == "05"
           puts "May had the most crimes with #{date.count(s)}"
       elsif s == "06"
           puts "June had the most crimes with #{date.count(s)}"
       elsif s == "07"
           puts "July had the most crimes with #{date.count(s)}"
       elsif s == "08"
           puts "August had the most crimes with #{date.count(s)}"
       elsif s == "09"
           puts "September had the most crimes with #{date.count(s)}"
       elsif s == "10"
           puts "October had the most crimes with #{date.count(s)}"
       elsif s == "11"
           puts "November had the most crimes with #{date.count(s)}"
       elsif s == '12'
           puts "December had the most crimes with #{date.count(s)}"
       end
   end

end
