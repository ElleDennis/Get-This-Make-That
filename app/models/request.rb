class Request < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :content

  acts_as_commentable

  scope :active, -> do
    where('created_at > ?', 3.weeks.ago).
      order(created_at: :desc)
  end
end
