class ChangeGramsToListings < ActiveRecord::Migration
  def change
    rename_table :grams, :listings
  end
end
