class Listing < ActiveRecord::Base
  validates_presence_of :title, :content, :state, :zipcode
end
