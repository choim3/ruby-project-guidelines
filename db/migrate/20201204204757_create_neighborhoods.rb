class CreateNeighborhoods < ActiveRecord::Migration[5.2]
  def change
   create_table :neighborhoods do |x|
     x.string :name
   end
   end
end
