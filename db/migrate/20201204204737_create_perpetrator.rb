class CreatePerpetrator < ActiveRecord::Migration[5.2]
  def change
    create_table :perpetrators do |x|
      x.string :name
      x.integer :age
      x.string :gender
    end
  end
end
