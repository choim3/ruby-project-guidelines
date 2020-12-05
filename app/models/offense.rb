class Offense < ActiveRecord::Base
  belongs_to :perpetrator
  belongs_to :neighborhood
end

def get_most_offenses
end
