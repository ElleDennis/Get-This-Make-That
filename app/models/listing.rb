class Listing < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :image_url, :title, :content, :state, :zipcode

  acts_as_commentable

  scope :active, -> do
    where('created_at > ?', 3.weeks.ago).
      order(created_at: :desc)
  end
end
