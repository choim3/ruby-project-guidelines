require 'faker'
require_all 'app'

Perpetrator.destroy_all
#Neighborhood.destroy_all
#Offense.destroy_all


100.times do
    Perpetrator.create(name:Faker::Name.name, age:rand(15..65), gender: Faker::Gender.type)
end

GetRequester.neighborhood_names.each do |x|
    Neighborhood.create(name: x)
end

GetRequester.parse_json.each do |x|
    Offense.create(type_of_offense: x['offense'], date: x['report_datetime'], neighborhood_name: x['mcpp'], perpetrator_id: Perpetrator.all.sample.id)
end
