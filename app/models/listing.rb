class Listing < ActiveRecord::Base
  validates_presence_of :title, :content, :state, :zipcode

  scope :active, -> do
    where('created_at > ?', 3.weeks.ago).
      order(created_at: :desc)
  end
end
