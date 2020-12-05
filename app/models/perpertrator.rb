class Perpetrator < ActiveRecord::Base
  has_many :offenses
  has_many :neighborhoods, through: :offenses

end
