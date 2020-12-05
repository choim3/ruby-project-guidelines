class CreateOffenses < ActiveRecord::Migration[5.2]
  def change
    create_table :offenses do |x|
      x.string :type_of_offense
      x.datetime :date
      x.string :neighborhood_name
      x.integer :perpetrator_id
    end
  end
end
