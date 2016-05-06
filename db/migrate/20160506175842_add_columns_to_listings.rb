class AddColumnsToListings < ActiveRecord::Migration
  def change
    change_table :listings do |t|
      t.string :state
      t.string :zipcode

      t.remove :country_code
    end
  end
end
